Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF532A4013
	for <lists.virtualization@lfdr.de>; Tue,  3 Nov 2020 10:30:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CEB7186D64;
	Tue,  3 Nov 2020 09:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3W2JYRmqTDM; Tue,  3 Nov 2020 09:30:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7291286C98;
	Tue,  3 Nov 2020 09:30:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56E03C0889;
	Tue,  3 Nov 2020 09:30:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E057AC08A1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 09:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B11A720519
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 09:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AzN+UNXZJtGm
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 09:30:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTP id F11E020517
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 09:30:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08299B119;
 Tue,  3 Nov 2020 09:30:20 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, kraxel@redhat.com, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Subject: [PATCH v7 03/10] drm/etnaviv: Remove empty etnaviv_gem_prime_vunmap()
Date: Tue,  3 Nov 2020 10:30:08 +0100
Message-Id: <20201103093015.1063-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201103093015.1063-1-tzimmermann@suse.de>
References: <20201103093015.1063-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 xen-devel@lists.xenproject.org, spice-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

VGhlIGZ1bmN0aW9uIGV0bmF2aXZfZ2VtX3ByaW1lX3Z1bm1hcCgpIGlzIGVtcHR5LiBSZW1vdmUg
aXQgYmVmb3JlCmNoYW5naW5nIHRoZSBpbnRlcmZhY2UgdG8gdXNlIHN0cnVjdCBkcm1fYnVmX21h
cC4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
PgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpU
ZXN0ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZXRuYXZpdi9ldG5hdml2X2Rydi5oICAgICAgIHwgMSAtCiBkcml2ZXJzL2dwdS9kcm0v
ZXRuYXZpdi9ldG5hdml2X2dlbS5jICAgICAgIHwgMSAtCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZp
di9ldG5hdml2X2dlbV9wcmltZS5jIHwgNSAtLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA3IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2
LmggYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2Rydi5oCmluZGV4IDkxNGYwODY3
ZmY3MS4uOTY4MmMyNmQ4OWJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9l
dG5hdml2X2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmgK
QEAgLTUyLDcgKzUyLDYgQEAgaW50IGV0bmF2aXZfZ2VtX21tYXAoc3RydWN0IGZpbGUgKmZpbHAs
IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKIGludCBldG5hdml2X2dlbV9tbWFwX29mZnNl
dChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdTY0ICpvZmZzZXQpOwogc3RydWN0IHNnX3Rh
YmxlICpldG5hdml2X2dlbV9wcmltZV9nZXRfc2dfdGFibGUoc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpvYmopOwogdm9pZCAqZXRuYXZpdl9nZW1fcHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3QgKm9iaik7Ci12b2lkIGV0bmF2aXZfZ2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaiwgdm9pZCAqdmFkZHIpOwogaW50IGV0bmF2aXZfZ2VtX3ByaW1lX21tYXAoc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmosCiAJCQkgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSk7CiBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmV0bmF2aXZfZ2VtX3ByaW1lX2ltcG9ydF9zZ190
YWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZf
Z2VtLmMKaW5kZXggNjdkOWEyYjllYTZhLi5iYmQyMzU0NzM2NDUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9nZW0uYwpAQCAtNTcxLDcgKzU3MSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgZXRuYXZpdl9nZW1fb2JqZWN0X2Z1bmNzID0gewogCS51
bnBpbiA9IGV0bmF2aXZfZ2VtX3ByaW1lX3VucGluLAogCS5nZXRfc2dfdGFibGUgPSBldG5hdml2
X2dlbV9wcmltZV9nZXRfc2dfdGFibGUsCiAJLnZtYXAgPSBldG5hdml2X2dlbV9wcmltZV92bWFw
LAotCS52dW5tYXAgPSBldG5hdml2X2dlbV9wcmltZV92dW5tYXAsCiAJLnZtX29wcyA9ICZ2bV9v
cHMsCiB9OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dl
bV9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fcHJpbWUuYwpp
bmRleCAxMzVmYmZmNmZlY2YuLmE2ZDk5MzJhMzJhZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fcHJpbWUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRu
YXZpdi9ldG5hdml2X2dlbV9wcmltZS5jCkBAIC0yNywxMSArMjcsNiBAQCB2b2lkICpldG5hdml2
X2dlbV9wcmltZV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQogCXJldHVybiBldG5h
dml2X2dlbV92bWFwKG9iaik7CiB9CiAKLXZvaWQgZXRuYXZpdl9nZW1fcHJpbWVfdnVubWFwKHN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCB2b2lkICp2YWRkcikKLXsKLQkvKiBUT0RPIG1zbV9n
ZW1fdnVubWFwKCkgKi8KLX0KLQogaW50IGV0bmF2aXZfZ2VtX3ByaW1lX21tYXAoc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmosCiAJCQkgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIHsK
LS0gCjIuMjkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
