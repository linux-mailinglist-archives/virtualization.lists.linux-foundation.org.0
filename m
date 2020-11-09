Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5482AB4FB
	for <lists.virtualization@lfdr.de>; Mon,  9 Nov 2020 11:33:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C9FA485C28;
	Mon,  9 Nov 2020 10:32:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id we-k8D-qEgpq; Mon,  9 Nov 2020 10:32:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B01CC86044;
	Mon,  9 Nov 2020 10:32:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C4D6C088B;
	Mon,  9 Nov 2020 10:32:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97824C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Nov 2020 10:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 836CE2051E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Nov 2020 10:32:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qjtZbgrmx7OP
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Nov 2020 10:32:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id EC12F2051D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Nov 2020 10:32:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2DD92AF2F;
 Mon,  9 Nov 2020 10:32:50 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, robdclark@gmail.com, sean@poorly.run
Subject: [PATCH 2/2] drm/mediatek: Use struct dma_buf_map in GEM vmap ops
Date: Mon,  9 Nov 2020 11:32:42 +0100
Message-Id: <20201109103242.19544-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109103242.19544-1-tzimmermann@suse.de>
References: <20201109103242.19544-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Melissa Wen <melissa.srw@gmail.com>,
 Eric Anholt <eric@anholt.net>, Huang Rui <ray.huang@amd.com>,
 Madhav Chauhan <madhav.chauhan@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Herring <robh@kernel.org>,
 xen-devel@lists.xenproject.org, lima@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Luben Tuikov <luben.tuikov@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 etnaviv@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 spice-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Arunpravin <apaneers@amd.com>, linux-arm-kernel@lists.infradead.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Sandy Huang <hjc@rock-chips.com>,
 Nirmoy Das <Nirmoy.Das@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Rml4ZXMgYSBidWlsZCBmYWlsdXJlIHdpdGggbWVkaWF0ZWsuCgpUaGlzIGNoYW5nZSB3YXMgc3Vw
cG9zZWQgdG8gYmUgcGFydCBvZiBjb21taXQgNDlhM2Y1MWRmZWVlICgiZHJtL2dlbToKVXNlIHN0
cnVjdCBkbWFfYnVmX21hcCBpbiBHRU0gdm1hcCBvcHMgYW5kIGNvbnZlcnQgR0VNIGJhY2tlbmRz
IiksIGJ1dAptZWRpYXRlayB3YXMgZm9yZ290dGVuLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkZpeGVzOiA0OWEzZjUxZGZlZWUgKCJkcm0v
Z2VtOiBVc2Ugc3RydWN0IGRtYV9idWZfbWFwIGluIEdFTSB2bWFwIG9wcyBhbmQgY29udmVydCBH
RU0gYmFja2VuZHMiKQpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpDYzogRGF2ZSBB
aXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1
dHJvbml4LmRlPgpDYzogUnVzc2VsbCBLaW5nIDxsaW51eCtldG5hdml2QGFybWxpbnV4Lm9yZy51
az4KQ2M6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+CkNj
OiBRaWFuZyBZdSA8eXVxODI1QGdtYWlsLmNvbT4KQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVk
aGF0LmNvbT4KQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNjOiBUb21ldSBWaXpv
c28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgpDYzogU3RldmVuIFByaWNlIDxzdGV2ZW4u
cHJpY2VAYXJtLmNvbT4KQ2M6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bj
b2xsYWJvcmEuY29tPgpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvD
tm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IFNhbmR5IEh1YW5nIDxoamNAcm9j
ay1jaGlwcy5jb20+CkNjOiAiSGVpa28gU3TDvGJuZXIiIDxoZWlrb0BzbnRlY2guZGU+CkNjOiBI
YW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBv
b3JseS5ydW4+CkNjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpDYzogUm9kcmlnbyBT
aXF1ZWlyYSA8cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFpbC5jb20+CkNjOiBNZWxpc3NhIFdlbiA8
bWVsaXNzYS5zcndAZ21haWwuY29tPgpDYzogSGFuZWVuIE1vaGFtbWVkIDxoYW1vaGFtbWVkLnNh
QGdtYWlsLmNvbT4KQ2M6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVz
aGNoZW5rb0BlcGFtLmNvbT4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5v
cmc+CkNjOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgpDYzogTWFy
ZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgpDYzogQXJ1bnByYXZpbiA8
YXBhbmVlcnNAYW1kLmNvbT4KQ2M6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+CkNjOiBM
dWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPgpDYzogTWFkaGF2IENoYXVoYW4gPG1h
ZGhhdi5jaGF1aGFuQGFtZC5jb20+CkNjOiBOaXJtb3kgRGFzIDxOaXJtb3kuRGFzQGFtZC5jb20+
CkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVr
PgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZXRuYXZpdkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKQ2M6IGxpbWFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBub3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogdmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKQ2M6IHNwaWNlLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwpDYzogbGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZ2VtLmMgfCAyMCArKysrKysrKysrKystLS0tLS0tLQogZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZ2VtLmggfCAgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZ2VtLmMKaW5kZXggY2RkMWE2ZTYxNTY0Li4yOGEyZWUxMzM2ZWYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jCkBAIC0yNDAsMjMgKzI0MCwyNSBAQCBzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKm10a19nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsCiAJcmV0dXJuICZtdGtfZ2VtLT5iYXNlOwogfQogCi12b2lkICptdGtfZHJtX2dl
bV9wcmltZV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQoraW50IG10a19kcm1fZ2Vt
X3ByaW1lX3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCBkbWFfYnVmX21h
cCAqbWFwKQogewogCXN0cnVjdCBtdGtfZHJtX2dlbV9vYmogKm10a19nZW0gPSB0b19tdGtfZ2Vt
X29iaihvYmopOwotCXN0cnVjdCBzZ190YWJsZSAqc2d0OworCXN0cnVjdCBzZ190YWJsZSAqc2d0
ID0gTlVMTDsKIAl1bnNpZ25lZCBpbnQgbnBhZ2VzOwogCiAJaWYgKG10a19nZW0tPmt2YWRkcikK
LQkJcmV0dXJuIG10a19nZW0tPmt2YWRkcjsKKwkJZ290byBvdXQ7CiAKIAlzZ3QgPSBtdGtfZ2Vt
X3ByaW1lX2dldF9zZ190YWJsZShvYmopOwogCWlmIChJU19FUlIoc2d0KSkKLQkJcmV0dXJuIE5V
TEw7CisJCXJldHVybiBQVFJfRVJSKHNndCk7CiAKIAlucGFnZXMgPSBvYmotPnNpemUgPj4gUEFH
RV9TSElGVDsKIAltdGtfZ2VtLT5wYWdlcyA9IGtjYWxsb2MobnBhZ2VzLCBzaXplb2YoKm10a19n
ZW0tPnBhZ2VzKSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFtdGtfZ2VtLT5wYWdlcykKLQkJZ290byBv
dXQ7CisJaWYgKCFtdGtfZ2VtLT5wYWdlcykgeworCQlrZnJlZShzZ3QpOworCQlyZXR1cm4gLUVO
T01FTTsKKwl9CiAKIAlkcm1fcHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyhzZ3QsIG10a19n
ZW0tPnBhZ2VzLCBOVUxMLCBucGFnZXMpOwogCkBAIC0yNjUsMTMgKzI2NywxNSBAQCB2b2lkICpt
dGtfZHJtX2dlbV9wcmltZV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQogCiBvdXQ6
CiAJa2ZyZWUoc2d0KTsKKwlkbWFfYnVmX21hcF9zZXRfdmFkZHIobWFwLCBtdGtfZ2VtLT5rdmFk
ZHIpOwogCi0JcmV0dXJuIG10a19nZW0tPmt2YWRkcjsKKwlyZXR1cm4gMDsKIH0KIAotdm9pZCBt
dGtfZHJtX2dlbV9wcmltZV92dW5tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHZvaWQg
KnZhZGRyKQordm9pZCBtdGtfZHJtX2dlbV9wcmltZV92dW5tYXAoc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpvYmosIHN0cnVjdCBkbWFfYnVmX21hcCAqbWFwKQogewogCXN0cnVjdCBtdGtfZHJtX2dl
bV9vYmogKm10a19nZW0gPSB0b19tdGtfZ2VtX29iaihvYmopOworCXZvaWQgKnZhZGRyID0gbWFw
LT52YWRkcjsKIAogCWlmICghbXRrX2dlbS0+cGFnZXMpCiAJCXJldHVybjsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5oIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZ2VtLmgKaW5kZXggZmY5Zjk3NmQ5ODA3Li42ZGE1Y2NiNGI5MzMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5oCkBAIC00NSw3ICs0NSw3IEBA
IGludCBtdGtfZHJtX2dlbV9tbWFwX2J1ZihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwKIHN0
cnVjdCBzZ190YWJsZSAqbXRrX2dlbV9wcmltZV9nZXRfc2dfdGFibGUoc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmopOwogc3RydWN0IGRybV9nZW1fb2JqZWN0ICptdGtfZ2VtX3ByaW1lX2ltcG9y
dF9zZ190YWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJc3RydWN0IGRtYV9idWZfYXR0
YWNobWVudCAqYXR0YWNoLCBzdHJ1Y3Qgc2dfdGFibGUgKnNnKTsKLXZvaWQgKm10a19kcm1fZ2Vt
X3ByaW1lX3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwotdm9pZCBtdGtfZHJtX2dl
bV9wcmltZV92dW5tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHZvaWQgKnZhZGRyKTsK
K2ludCBtdGtfZHJtX2dlbV9wcmltZV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBz
dHJ1Y3QgZG1hX2J1Zl9tYXAgKm1hcCk7Cit2b2lkIG10a19kcm1fZ2VtX3ByaW1lX3Z1bm1hcChz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IGRtYV9idWZfbWFwICptYXApOwogCiAj
ZW5kaWYKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
