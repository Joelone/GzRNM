<html>
<body>
<p class="p1"><b>Radiosity Normal Readme</b></p>
<p class="p2"><b></b><br></p>
<p class="p3">This guide is intended to assist new users in using Radiosity Normal Maps and Compressed Radiosity Normal Maps within Unity3D.</p>
<p class="p4"><br></p>
<p class="p3">Within the Snow Cat Solutions folder in your project's hierarchy, there is a folder called RNM Basis Maps.<span class="Apple-converted-space">  </span>Each texture corresponds to a given "basis" for which RNMs should be generated.<span class="Apple-converted-space">  </span>These textures are only to be used with your 3D application of choice to generate the appropriate RNMs.</p>
<p class="p4"><br></p>
<p class="p3">Using the basis textures is simple enough; you simply supply the texture as a normal map using the primary UV of your mesh in your modeling application.<span class="Apple-converted-space">  </span>It's <b>very important </b>that the basis maps are applied to the primary UV of the mesh, not the secondary or lightmap UV.<span class="Apple-converted-space">  </span>Otherwise, you will not have the appropriate basis baked into your lightmaps.</p>
<p class="p4"><br></p>
<p class="p3">The basis textures are named after the basis they represent in the shaders within Unity.<span class="Apple-converted-space">  </span>You can use the table below to determine which lightmaps should go where in the material within Unity.</p>
<pre>
| Basis Map      | Texture Spot
================================
| RNM Basis Map X| RNM X Component
| RNM Basis Map Y| RNM Y Component
| RNM Basis Map Z| RNM Z Component
</pre>
<p class="p3">So for example, if you're using an application like Modo, and you bake a lightmap with RNM Basis Map X, then the resulting lightmap should be used in the RNM X Component for the object's material.</p>
<p class="p4"><br></p>
<p class="p3">These RNM shaders also include a new type of RNM called Compressed Radiosity Normal Maps.</p>
<p class="p4"><br></p>
<p class="p3">Creating CRNMs are simple enough; you take the three RNM light maps that you have generated, and merge them into one lightmap.<span class="Apple-converted-space">  </span>You desaturate each lightmap, and merge them into a different color channel of the CRNM in your image editing application of choice.<span class="Apple-converted-space">  </span>You can refer to the table below to know which lightmap goes into which channel of the CRNM.</p>
<pre>
| Lightmap  | CRNM Color Channel
===============================
| Lightmap X| Red Channel
| Lightmap Y| Green Channel
| Lightmap Z| Blue Channel
</pre>
<p class="p3">The shaders also have support for valve's "Self-Shadowed Bump Maps".<span class="Apple-converted-space">  </span>These bump maps can either include self-shadowing, or simply be normal maps stored in an RNM basis.<span class="Apple-converted-space">  </span>The key advantages of using this is for better performance on iOS, and more believable visuals.<span class="Apple-converted-space">  </span>In order to generate the appropriate SSBumps, you need something like SSBump Generator (which can be find here <a href="http://ssbump-generator.yolasite.com/">http://ssbump-generator.yolasite.com/</a>).<span class="Apple-converted-space">  </span>Please note: SSBumps are only supported under forward rendering.</p>
<p class="p4"><br></p>
<p class="p3">3D Modeling package specific tutorials and documentation is coming soon!</p>
<p class="p4"><br></p>
<p class="p3">Donating helps to continue development of the project.</p>
<p class="p3"><a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=KF4XDQTCYVEXJ">Donate with PayPal</a>.</p>
</body>
</html>
