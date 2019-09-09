Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0C2AD36D
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 09:14:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2C1D789C;
	Mon,  9 Sep 2019 07:13:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C499E89C
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 07:13:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn
	[202.108.3.166])
	by smtp1.linuxfoundation.org (Postfix) with SMTP id 7E43AEC
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 07:13:51 +0000 (UTC)
Received: from unknown (HELO [IPv6:::ffff:172.20.10.2])([61.148.244.178])
	by sina.com with ESMTP
	id 5D75FBAB0002BC5A; Mon, 9 Sep 2019 15:13:48 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 92381354923368
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>
From: Hillf Danton <hdanton@sina.com>
Subject: Re: Xorg indefinitely hangs in kernelspace
Date: Mon, 9 Sep 2019 15:13:48 +0800
Importance: normal
X-Priority: 3
In-Reply-To: <20190909055219.q44k27cczwkuio3z@sirius.home.kraxel.org>
References: <20190906055322.17900-1-hdanton@sina.com>
	<20190909055219.q44k27cczwkuio3z@sirius.home.kraxel.org>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	HTML_MESSAGE, MISSING_MID, RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	"spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
	Jaak Ristioja <jaak@ristioja.ee>, Dave Airlie <airlied@redhat.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4956052146285112116=="
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org
Message-Id: <20190909071354.2C1D789C@mail.linuxfoundation.org>


--===============4956052146285112116==
Content-Type: multipart/alternative;
	boundary="_AD05A452-BEFD-47CB-8E14-119A02D5DF11_"


--_AD05A452-BEFD-47CB-8E14-119A02D5DF11_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

On Mon, 9 Sep 2019 from Gerd Hoffmann <kraxel@redhat.com>
>
> Hmm, I think the patch is wrong.  As far I know it is the qxl drivers's
> job to call ttm_eu_backoff_reservation().  Doing that automatically in
> ttm will most likely break other ttm users.
>
Perhaps.

>So I guess the call is missing in the qxl driver somewhere, most likely
>in some error handling code path given that this bug is a relatively
>rare event.
>
>There is only a single ttm_eu_reserve_buffers() call in qxl.
>So how about this?
>
No preference in either way if it is a right cure.

BTW a quick peep at the mainline tree shows not every
ttm_eu_reserve_buffers() pairs with ttm_eu_backoff_reservation()
without qxl being taken in account.

Hillf

--_AD05A452-BEFD-47CB-8E14-119A02D5DF11_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-indent:21.0pt;
	font-size:10.5pt;
	font-family:DengXian;}
span.DefaultFontHxMailStyle
	{mso-style-name:"Default Font HxMail Style";
	font-family:DengXian;
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1496729359;
	mso-list-type:hybrid;
	mso-list-template-ids:-1873276564 -1 67698691 67698693 67698689 67698691 6=
7698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0D8;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;
	font-family:Wingdings;
	mso-fareast-font-family:DengXian;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:\F06E;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:42.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F075;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:63.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F06C;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:84.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F06E;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:105.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F075;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:126.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F06C;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:147.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F06E;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F075;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:189.0pt;
	text-indent:-21.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style></head><body lang=3DZH-CN link=3Dblue vlink=3D"#954F72"><div cla=
ss=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US>Hi,</span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=
=3DMsoNormal><span lang=3DEN-US>On Mon, 9 Sep 2019 from Gerd Hoffmann &lt;k=
raxel@redhat.com&gt;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=
=3DEN-US>&gt;<o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3D=
EN-US>&gt; Hmm, I think the patch is wrong.=C2=A0 As far I know it is the q=
xl drivers's</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; job to =
call ttm_eu_backoff_reservation().=C2=A0 Doing that automatically in</span>=
</p><p class=3DMsoNormal><span lang=3DEN-US>&gt; ttm will most likely break=
 other ttm users.</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;<o:=
p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Perhaps.</=
span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-US>&gt;So I guess the call is missin=
g in the qxl driver somewhere, most likely</span></p><p class=3DMsoNormal><=
span lang=3DEN-US>&gt;in some error handling code path given that this bug =
is a relatively</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;rare =
event.</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;<o:p>&nbsp;</o=
:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;There is only a s=
ingle ttm_eu_reserve_buffers() call in qxl.</span></p><p class=3DMsoNormal>=
<span lang=3DEN-US>&gt;So how about this?</span></p><p class=3DMsoNormal><s=
pan lang=3DEN-US>&gt;<o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span=
 lang=3DEN-US>No preference in either way if it is a right cure.</span></p>=
<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p clas=
s=3DMsoNormal><span lang=3DEN-US>BTW a quick peep at the mainline tree show=
s not every</span></p><p class=3DMsoNormal><span lang=3DEN-US>ttm_eu_reserv=
e_buffers() pairs with ttm_eu_backoff_reservation()</span></p><p class=3DMs=
oNormal><span lang=3DEN-US>without qxl being taken in account.</span></p><p=
 class=3DMsoNormal><span class=3DDefaultFontHxMailStyle><span lang=3DEN-US>=
<o:p>&nbsp;</o:p></span></span></p><p class=3DMsoNormal><span class=3DDefau=
ltFontHxMailStyle><span lang=3DEN-US>Hillf<o:p></o:p></span></span></p></di=
v></body></html>=

--_AD05A452-BEFD-47CB-8E14-119A02D5DF11_--



--===============4956052146285112116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4956052146285112116==--


