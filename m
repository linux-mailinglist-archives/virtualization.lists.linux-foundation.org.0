Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E6D75333D
	for <lists.virtualization@lfdr.de>; Fri, 14 Jul 2023 09:39:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6356861321;
	Fri, 14 Jul 2023 07:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6356861321
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=OV/gdDYm;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nMR4Tsar
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xTpJBRksTYXt; Fri, 14 Jul 2023 07:39:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A62AF60AF2;
	Fri, 14 Jul 2023 07:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A62AF60AF2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5132C008D;
	Fri, 14 Jul 2023 07:39:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8A73C0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Jul 2023 07:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF58481F76
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Jul 2023 07:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF58481F76
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=OV/gdDYm; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nMR4Tsar
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Q-7J9YpJApQ
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Jul 2023 07:39:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37F2681F85
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37F2681F85
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Jul 2023 07:39:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E2F031FD65;
 Fri, 14 Jul 2023 07:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689320340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nMWGIzR5HguJc3P736wDMWr57FecGJdaqmJS12K5GD8=;
 b=OV/gdDYm2uAVKIOz4nhzePkYLXrydA5b3efhEo7z+cVzoc69jEcZ9YUPxA/NhvPVXLWvEK
 vJIvaON/yN1mFbFrVG7sKhziYU63JMVKYJGeW1n98N87iPjWLM8zYVr6K0n35gCWrr5LeV
 JgA1RKDnRqnC54CoGkXQO7OYQ/3TZwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689320340;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nMWGIzR5HguJc3P736wDMWr57FecGJdaqmJS12K5GD8=;
 b=nMR4Tsarzd8uBtjx+g3rJCIL8W+d0+uFe/ZArcyeUxAaSOobgaEVTX4FctsZNVklH+ZvS6
 4af1u0Io24CrO6Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4805313A15;
 Fri, 14 Jul 2023 07:38:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3v5aEJH7sGTTOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Jul 2023 07:38:57 +0000
Message-ID: <ebc6167a-0696-11d2-cb20-bcc7d23427aa@suse.de>
Date: Fri, 14 Jul 2023 09:38:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
 <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
 <20230713130337.fd2l67r23g2irifx@pengutronix.de>
 <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
 <78be52b8-5ffb-601a-84b2-ead2894973a6@suse.de>
 <d6160aeb-6344-b272-775a-cb665dca46ac@linux.intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <d6160aeb-6344-b272-775a-cb665dca46ac@linux.intel.com>
Cc: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Matt Roper <matthew.d.roper@intel.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 spice-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-sunxi@lists.linux.dev,
 Matthias Brugger <matthias.bgg@gmail.com>, Stylon Wang <stylon.wang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Dave Airlie <airlied@redhat.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?=c5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Zack Rusin <zackr@vmware.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Fei Yang <fei.yang@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, David Francis <David.Francis@amd.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Aaron Liu <aaron.liu@amd.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-rockchip@lists.infradead.org,
 Fangzhi Zuo <jerry.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Ripard <mripard@kernel.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Tian Tao <tiantao6@hisilicon.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-amlogic@lists.infradead.org, Evan Quan <evan.quan@amd.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Sandy Huang <hjc@rock-chips.com>,
 Swati Sharma <swati2.sharma@intel.com>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, Dan Carpenter <error27@gmail.com>,
 Karol Herbst <kherbst@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-hyperv@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Luca Coelho <luciano.coelho@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, Emma Anholt <emma@anholt.net>,
 Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Chia-I Wu <olvaffe@gmail.com>,
 Alan Liu <haoping.liu@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org,
 Alison Wang <alison.wang@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Mikko Perttunen <mperttunen@nvidia.com>,
 Yifan Zhang <yifan1.zhang@amd.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 John Stultz <jstultz@google.com>, Roman Li <roman.li@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Sam Ravnborg <sam@ravnborg.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Imre Deak <imre.deak@intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Liu Shixin <liushixin2@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, David Airlie <airlied@gmail.com>,
 Marek Vasut <marex@denx.de>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Russell King <linux@armlinux.org.uk>, Jani Nikula <jani.nikula@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 David Lechner <david@lechnology.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 amd-gfx@lists.freedesktop.org, Lang Yu <Lang.Yu@amd.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Wayne Lin <Wayne.Lin@amd.com>,
 Drew Davenport <ddavenport@chromium.org>, Nirmoy Das <nirmoy.das@intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Lucas Stach <l.stach@pengutronix.de>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4320500820518372005=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4320500820518372005==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jeLFGePkiFpCJh0eHqRS7GTg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jeLFGePkiFpCJh0eHqRS7GTg
Content-Type: multipart/mixed; boundary="------------NtcVQEWFF5WDzksvmBN1dmoE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jani Nikula <jani.nikula@intel.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
 dri-devel@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Liu Shixin <liushixin2@huawei.com>,
 linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Matt Roper <matthew.d.roper@intel.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 spice-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 linux-sunxi@lists.linux.dev, Stylon Wang <stylon.wang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?=c5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Zack Rusin
 <zackr@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Fei Yang
 <fei.yang@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, David Lechner <david@lechnology.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 David Francis <David.Francis@amd.com>, Aaron Liu <aaron.liu@amd.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 linux-rockchip@lists.infradead.org, Fangzhi Zuo <jerry.zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, =?UTF-8?Q?Jouni_H=c3=b6gander?=
 <jouni.hogander@intel.com>, Dave Airlie <airlied@redhat.com>,
 linux-mips@vger.kernel.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Evan Quan <evan.quan@amd.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Chunyan Zhang
 <zhang.lyra@gmail.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Sandy Huang <hjc@rock-chips.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Stultz <jstultz@google.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Drew Davenport <ddavenport@chromium.org>, Kevin Hilman
 <khilman@baylibre.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Dan Carpenter <error27@gmail.com>, Karol Herbst <kherbst@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-hyperv@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mairacanal@riseup.net>, Luca Coelho <luciano.coelho@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Alan Liu <haoping.liu@amd.com>,
 Philip Yang <Philip.Yang@amd.com>, Lyude Paul <lyude@redhat.com>,
 intel-gfx@lists.freedesktop.org, Alison Wang <alison.wang@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Chia-I Wu <olvaffe@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Imre Deak <imre.deak@intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Roman Li
 <roman.li@amd.com>, Paul Cercueil <paul@crapouillou.net>,
 Rob Clark <robdclark@gmail.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Russell King <linux@armlinux.org.uk>, Uma Shankar <uma.shankar@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 linux-tegra@vger.kernel.org, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <marek.olsak@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Orson Zhai <orsonzhai@gmail.com>, amd-gfx@lists.freedesktop.org,
 Jyri Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Daniel Vetter
 <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Message-ID: <ebc6167a-0696-11d2-cb20-bcc7d23427aa@suse.de>
Subject: Re: [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
 <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
 <20230713130337.fd2l67r23g2irifx@pengutronix.de>
 <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
 <78be52b8-5ffb-601a-84b2-ead2894973a6@suse.de>
 <d6160aeb-6344-b272-775a-cb665dca46ac@linux.intel.com>
In-Reply-To: <d6160aeb-6344-b272-775a-cb665dca46ac@linux.intel.com>

--------------NtcVQEWFF5WDzksvmBN1dmoE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDcuMjMgdW0gMTc6MTQgc2NocmllYiBUdnJ0a28gVXJzdWxpbjoNCj4g
DQo+IE9uIDEzLzA3LzIwMjMgMTY6MDksIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4g
SGkNCj4+DQo+PiBBbSAxMy4wNy4yMyB1bSAxNjo0MSBzY2hyaWViIFNlYW4gUGF1bDoNCj4+
PiBPbiBUaHUsIEp1bCAxMywgMjAyMyBhdCA5OjA04oCvQU0gVXdlIEtsZWluZS1Lw7ZuaWcN
Cj4+PiA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToNCj4+Pj4NCj4+
Pj4gaGVsbG8gU2VhbiwNCj4+Pj4NCj4+Pj4gT24gV2VkLCBKdWwgMTIsIDIwMjMgYXQgMDI6
MzE6MDJQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3RlOg0KPj4+Pj4gSSdkIHJlYWxseSBwcmVm
ZXIgdGhpcyBwYXRjaCAoc2VyaWVzIG9yIHNpbmdsZSkgaXMgbm90IGFjY2VwdGVkLiBUaGlz
DQo+Pj4+PiB3aWxsIGNhdXNlIHByb2JsZW1zIGZvciBldmVyeW9uZSBjaGVycnktcGlja2lu
ZyBwYXRjaGVzIHRvIGENCj4+Pj4+IGRvd25zdHJlYW0ga2VybmVsIChMVFMgb3IgZGlzdHJv
IHRyZWUpLiBJIHVzdWFsbHkgd291bGRuJ3QgZXhwZWN0DQo+Pj4+PiBzeW1wYXRoeSBoZXJl
LCBidXQgdGhlIHF1ZXN0aW9uYWJsZSBiZW5lZml0IGRvZXMgbm90IG91dHdlaWdoIHRoZSBj
b3N0DQo+Pj4+PiBJTVtiaWFzZWRdTy4NCj4+Pj4NCj4+Pj4gSSBhZ3JlZSB0aGF0IGZvciBi
YWNrcG9ydHMgdGhpcyBpc24ndCBzbyBuaWNlLiBIb3dldmVyIHdpdGggdGhlIHNwbGl0DQo+
Pj4+IGFwcHJvYWNoICh0aGF0IHdhcyBhcmd1bWVudGVkIGFnYWluc3QgaGVyZSkgaXQncyBu
b3Qgc29vIGJhZC4gUGF0Y2ggIzENCj4+Pj4gKGFuZCBzaW1pbGFyIGNoYW5nZXMgZm9yIHRo
ZSBvdGhlciBhZmZlY3RlZCBzdHJ1Y3R1cmVzKSBjb3VsZCBiZQ0KPj4+PiB0cml2aWFsbHkg
YmFja3BvcnRlZCBhbmQgd2l0aCB0aGF0IGl0IGRvZXNuJ3QgbWF0dGVyIGlmIHlvdSB3cml0
ZSANCj4+Pj4gZGV2IG9yDQo+Pj4+IGRybSAob3Igd2hhdGV2ZXIgbmFtZSBpcyBjaG9zZW4g
aW4gdGhlIGVuZCk7IGJvdGggd29yayBpbiB0aGUgc2FtZSB3YXkuDQo+Pj4NCj4+PiBQYXRj
aCAjMSBhdm9pZHMgdGhlIG5lZWQgdG8gYmFja3BvcnQgdGhlIGVudGlyZSBzZXQsIGhvd2V2
ZXIgZXZlcnkNCj4+PiBjaGFuZ2Ugb2NjdXJpbmcgYWZ0ZXIgdGhlIHJlbmFtZSBwYXRjaGVz
IHdpbGwgY2F1c2UgY29uZmxpY3RzIG9uDQo+Pj4gZnV0dXJlIGNoZXJyeS1waWNrcy4gRG93
bnN0cmVhbSBrZXJuZWxzIHdpbGwgaGF2ZSB0byBiYWNrcG9ydCB0aGUNCj4+PiB3aG9sZSBz
ZXQuIEJhY2twb3J0aW5nIHRoZSBlbnRpcmUgc2V0IHdpbGwgY3JlYXRlIGFuIGVwb2NoIGlu
DQo+Pj4gZG93bnN0cmVhbSBrZXJuZWxzIHdoZXJlIGNoZXJyeS1waWNraW5nIHBhdGNoZXMg
cHJlY2VkaW5nIHRoaXMgc2V0DQo+Pj4gd2lsbCBuZWVkIHRvIHVuZGVyZ28gY29uZmxpY3Qg
cmVzb2x1dGlvbiBhcyB3ZWxsLiBBcyBtZW50aW9uZWQgaW4gbXkNCj4+PiBwcmV2aW91cyBl
bWFpbCwgSSBkb24ndCBleHBlY3Qgc3ltcGF0aHkgaGVyZSwgaXQncyBwYXJ0IG9mIG1haW50
YWluaW5nDQo+Pj4gYSBkb3duc3RyZWFtIGtlcm5lbCwgYnV0IHRoZXJlIGlzIGEgcmVhbCBj
b3N0IHRvIGtlcm5lbCBjb25zdW1lcnMuDQo+Pj4NCj4+Pj4NCj4+Pj4gQnV0IGV2ZW4gd2l0
aCB0aGUgb25lLXBhdGNoLXBlci1yZW5hbWUgYXBwcm9hY2ggSSdkIGNvbnNpZGVyIHRoZQ0K
Pj4+PiByZW5hbWluZyBhIG5ldCB3aW4sIGJlY2F1c2UgZWFzZSBvZiB1bmRlcnN0YW5kaW5n
IGNvZGUgaGFzIGEgYmlnIHZhbHVlLg0KPj4+PiBJdCdzIHZhbHVlIGlzIG5vdCBzbyBlYXN5
IG1lYXN1cmFibGUgYXMgImNvbmZsaWN0cyB3aGVuIGJhY2twb3J0aW5nIiwNCj4+Pj4gYnV0
IGl0IGFsc28gbWF0dGVycyBpbiBzYXkgdHdvIHllYXJzIGZyb20gbm93LCB3aGlsZSBiYWNr
cG9ydGluZw0KPj4+PiBzaG91bGRuJ3QgYmUgYW4gaXNzdWUgdGhlbiBhbnkgbW9yZS4NCj4+
Pg0KPj4+IFlvdSd2ZSByaWdodGx5IGlkZW50aWZpZWQgdGhlIGNvbmplY3R1cmUgaW4geW91
ciBzdGF0ZW1lbnQuIEkndmUgYmVlbg0KPj4+IG9uIGJvdGggc2lkZXMgb2YgdGhlIGFyZ3Vt
ZW50LCBoYXZpbmcgd3JpdHRlbi9tYWludGFpbmVkIGRybSBjb2RlDQo+Pj4gdXBzdHJlYW0g
YW5kIGNoZXJyeS1waWNrZWQgY2hhbmdlcyB0byBhIGRvd25zdHJlYW0ga2VybmVsLiBQZXJo
YXBzDQo+Pj4gaXQncyBiZWNhdXNlIGRybSdzIGRlZmluaXRpb24gb2YgZGV2IGlzIGluZ3Jh
aW5lZCBpbiBteSBtdXNjbGUgbWVtb3J5LA0KPj4+IG9yIG1heWJlIGl0J3MgYmVjYXVzZSBJ
IGRvbid0IGRvIGEgbG90IG9mIHVwc3RyZWFtIGRldmVsb3BtZW50IHRoZXNlDQo+Pj4gZGF5
cywgYnV0IEkganVzdCBoYXZlIGEgaGFyZCB0aW1lIHNlZWluZyB0aGUgYmVuZWZpdCBoZXJl
Lg0KPj4NCj4+IEkgY2FuIG9ubHkgc2Vjb25kIHdoYXQgU2VhbiB3cml0ZXMuIEkndmUgZG9u
ZSBxdWl0ZSBhIGJpdCBvZiANCj4+IGJhY2twb3J0aW5nIG9mIERSTSBjb2RlLiBJdCdzIGhh
cmQgYWxyZWFkeS4gQW5kIHRoaXMga2luZCBvZiBjaGFuZ2UgaXMgDQo+PiBnb2luZyB0byB0
byBhZmZlY3QgYWxtb3N0IGV2ZXJ5IGJhY2twb3J0ZWQgRFJNIHBhdGNoIGluIHRoZSBjb21p
bmcgDQo+PiB5ZWFycy4gTm90IGp1c3QgZm9yIGRpc3RyaWJ1dGlvbiBrZXJuZWxzLCBidXQg
YWxzbyBmb3IgdXBzdHJlYW0ncyANCj4+IHN0YWJsZSBzZXJpZXMuIEl0J3MgcmVhbGx5IG9u
bHkgcG9zc2libGUgdG8gZG8gdGhpcyBjaGFuZ2Ugb3ZlciBtYW55IA0KPj4gcmVsZWFzZXMg
d2hpbGUga2VlcGluZyBjb21wYXRpYmxlIHdpdGggdGhlIG9sZCBuYW1lLiBTbyB0aGUgbW9y
ZSBJIA0KPj4gdGhpbmsgYWJvdXQgaXQsIHRoZSBsZXNzIEkgbGlrZSB0aGlzIGNoYW5nZS4N
Cj4gDQo+IEkndmUgZG9uZSBteSBzaGFyZSBvZiBiYWNrcG9ydGluZywgYW5kIHN0aWxsIGFt
IGRvaW5nIGl0LCBzbyBJIGNhbiBzYXkgSSANCj4gZGlzbGlrZSBpdCBhcyBtdWNoIGFzIGFu
eW9uZSwgaG93ZXZlci4uIElzIHRoaXMgYW4gYXJndW1lbnQgd2hpY2ggdGhlIA0KPiBrZXJu
ZWwgYXMgYSB3aWRlciBlbnRpdHkgdHlwaWNhbGx5IGFjY2VwdHM/IElmIG5vdCBjb3VsZCBp
dCBiZSBhIA0KPiBzbGlwcGVyeSBzbG9wZSB0byBzdGFydCBhIHByZWNlZGVudD8NCg0KSU1I
TyB1cHN0cmVhbSBwYXRjaGVzIHNob3VsZCBvbmx5IGJlIGp1ZGdlZCBieSB0aGVpciBlZmZl
Y3Qgb24gdGhlIA0KdXBzdHJlYW0uIEJhY2twb3J0aW5nLCBBUEkgc3RhYmlsaXR5LCBvdXQt
b2YtdHJlZSBkcml2ZXJzLCBldGMgc2hvdWxkIA0Kbm90IGJlIGEgY29uY2Vybi4gSSB0aGlu
ayB0aGF0IHdlICh0aGUgRFJNIGRldnMpIGFyZSBtb3N0bHkgbGl2aW5nIHVwIHRvIA0KdGhh
dCBpZGVhbC4gT1RPSCBpZiBhIGNoYW5nZSBoYXMgYmVlbiBhY2NlcHRlZCwgaXQncyBmYWly
IHRvIGFzayBob3cgdG8gDQptYWtlIGl0IGluIHRoZSBsZWFzdCBpbnRydXNpdmUgd2F5Lg0K
DQpCdXQgd2l0aCB0aGlzIGNoYW5nZSwgaXQgZG9lc24ndCBhZGQgdXAgZm9yIG1lLiBUaGUg
YmVuZWZpdCB0byBMaW51eCBpcyANCnJhdGhlciBjb3NtZXRpYy4gQW5kIHRoZSBwb3NzaWJs
ZSBkb3duc2lkZXMgYXJlIHNpZ25pZmljYW50IGV2ZW4gaWYgd2UgDQppZ25vcmUgZG93bnN0
cmVhbSBkaXN0cmlidXRpb24ga2VybmVscy4gTWVyZ2luZyBiZXR3ZWVuIERSTSB0cmVlcyB3
aWxsIA0KYmUgYWZmZWN0ZWQsIGJhY2twb3J0aW5nIGludG8gc3RhYmxlIGtlcm5lbHMgYXMg
d2VsbCwgdGhlIHJlbmFtZSB3aWxsIA0KbWVzcyB1cCBnaXQgYmxhbWUgd2l0aCByZW5hbWUg
Y29tbWl0cy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gSXQgaXMgYSBob25l
c3QgcXVlc3Rpb24gLSBJIGFtIG5vdCBmYW1pbGlhciBpZiB0aGVyZSB3ZXJlIG9yIHdlcmUg
bm90IA0KPiBhbnkgc2ltaWxhciBkaXNjdXNzaW9ucyBpbiB0aGUgcGFzdC4NCj4gDQo+IE15
IGd1dCBmZWVsaW5nIGlzIHRoYXQgKmlmKiB0aGVyZSBpcyBhIGNvbnNlbnN1cyB0aGF0IHNv
bWV0aGluZyANCj4gX2ltcHJvdmVzXyB0aGUgY29kZSBiYXNlIHNpZ25pZmljYW50bHksIGJh
Y2twb3J0aW5nIHBhaW5zIHNob3VsZCANCj4gcHJvYmFibHkgbm90IGJlIHdlaWdodGVkIHZl
cnkgaGVhdmlseSBhcyBhIGNvbnRyYSBhcmd1bWVudC4NCj4gDQo+IFJlZ2FyZHMsDQo+IA0K
PiBUdnJ0a28NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------NtcVQEWFF5WDzksvmBN1dmoE--

--------------jeLFGePkiFpCJh0eHqRS7GTg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSw+5AFAwAAAAAACgkQlh/E3EQov+CJ
FRAAs3UnPVAh602q8J7TFsiuYzv75xdkD8C1ihsIF3xnPxQT4AwrlZzGu4Uelh/Db1o8yFEitfnA
Ghk92aBwnLnf5crMh+qux1g/HHhYMLAGvmiGbR8H1tIx7VO3n4E/gm8OMkVG7xQ0Tz4+Qs8oTiJK
kFpsq/h6tqmJTjGbBnwTCMeHoYGFZM4h+KfSAYrMkT3lD/WSYbFmKrtSrmVcUbax/trVPRyEDyV1
D5uAUaWHZYEIZMmHPD65yfbjmAKKvXkCFbaHS0dwfGfuNjTS/tVtoFSohLsKThhgn3lSHnPpzx3K
4r83L4KZRQCDTM9vsTG2JYxJoq+Liw70fLe8gFXO6xD0Z8IWSTG+a8kgeKYtJ1kDtw9nfzZlUoZh
zFxr2af/nGZRpLjA1enMf0GRisUvW3CtTmvdYQwBoEULHpAwUqGoDVAvz1lMUgew/Ezm65E/qO0X
9mjGUHNEne4/DZ1y1cO68JQO+F3mgFTOM6nRrlboy+wGlyxLwthlMkSfsCwF3elI3/zC1NXqNfk+
9qkQfSm4QsV+6amus2nwk3HuV1i4oRdy9YpQ+k2NvFAKjh6AS4JxTEBCtoZ4pq5Z4z92GrWpBS8P
tVzDaIy4+/mZeIQbou1prQZzpZdPSVKLCpfys3YCEeT+G4s0WAXhsOpvkh/Qc3ob7418D7bqWFti
6q8=
=i/hH
-----END PGP SIGNATURE-----

--------------jeLFGePkiFpCJh0eHqRS7GTg--

--===============4320500820518372005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4320500820518372005==--
