Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D0F81E5B
	for <lists.virtualization@lfdr.de>; Mon,  5 Aug 2019 16:01:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9A16DEAF;
	Mon,  5 Aug 2019 14:01:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F099CB5F
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 14:01:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B7FCA829
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 14:01:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8965130BCB81;
	Mon,  5 Aug 2019 14:01:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
	[10.36.116.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41A7D7190F;
	Mon,  5 Aug 2019 14:01:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 49FBC17473; Mon,  5 Aug 2019 16:01:20 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 03/17] drm/qxl: use embedded gem object
Date: Mon,  5 Aug 2019 16:01:05 +0200
Message-Id: <20190805140119.7337-4-kraxel@redhat.com>
In-Reply-To: <20190805140119.7337-1-kraxel@redhat.com>
References: <20190805140119.7337-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 05 Aug 2019 14:01:24 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: thomas@shipmail.org, daniel@ffwll.ch, David Airlie <airlied@linux.ie>,
	ckoenig.leichtzumerken@gmail.com, intel-gfx@lists.freedesktop.org,
	open list <linux-kernel@vger.kernel.org>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>, bskeggs@redhat.com,
	tzimmermann@suse.de, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

RHJvcCBkcm1fZ2VtX29iamVjdCBmcm9tIHF4bF9ibywgdXNlIHRoZQp0dG1fYnVmZmVyX29iamVj
dC5iYXNlIGluc3RlYWQuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4KQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaCAgICAgfCAgNiArKystLS0K
IGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5oICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1
L2RybS9xeGwvcXhsX2NtZC5jICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X2RlYnVnZnMuYyB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kaXNwbGF5LmMgfCAg
OCArKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZ2VtLmMgICAgIHwgIDIgKy0KIGRy
aXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jICB8IDIwICsrKysrKysrKystLS0tLS0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9yZWxlYXNlLmMgfCAgMiArLQogZHJpdmVycy9ncHUv
ZHJtL3F4bC9xeGxfdHRtLmMgICAgIHwgIDQgKystLQogOSBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNl
cnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oCmluZGV4IGFlODJl
NWZhYjA5Yy4uOWUwMzRjNWZhODdkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4
bF9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaApAQCAtNzEsMTIgKzcx
LDEzIEBAIGV4dGVybiBpbnQgcXhsX21heF9pb2N0bHM7CiAJUVhMX0lOVEVSUlVQVF9DTElFTlRf
TU9OSVRPUlNfQ09ORklHKQogCiBzdHJ1Y3QgcXhsX2JvIHsKKwlzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QJdGJvOworCiAJLyogUHJvdGVjdGVkIGJ5IGdlbS5tdXRleCAqLwogCXN0cnVjdCBsaXN0
X2hlYWQJCWxpc3Q7CiAJLyogUHJvdGVjdGVkIGJ5IHRiby5yZXNlcnZlZCAqLwogCXN0cnVjdCB0
dG1fcGxhY2UJCXBsYWNlbWVudHNbM107CiAJc3RydWN0IHR0bV9wbGFjZW1lbnQJCXBsYWNlbWVu
dDsKLQlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QJdGJvOwogCXN0cnVjdCB0dG1fYm9fa21hcF9v
YmoJCWttYXA7CiAJdW5zaWduZWQgaW50IHBpbl9jb3VudDsKIAl2b2lkCQkJCSprcHRyOwpAQCAt
ODQsNyArODUsNiBAQCBzdHJ1Y3QgcXhsX2JvIHsKIAlpbnQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHR5cGU7CiAKIAkvKiBDb25zdGFudCBhZnRlciBpbml0aWFsaXphdGlvbiAqLwotCXN0
cnVjdCBkcm1fZ2VtX29iamVjdAkJZ2VtX2Jhc2U7CiAJdW5zaWduZWQgaW50IGlzX3ByaW1hcnk6
MTsgLyogaXMgdGhpcyBub3cgYSBwcmltYXJ5IHN1cmZhY2UgKi8KIAl1bnNpZ25lZCBpbnQgaXNf
ZHVtYjoxOwogCXN0cnVjdCBxeGxfYm8gKnNoYWRvdzsKQEAgLTkzLDcgKzkzLDcgQEAgc3RydWN0
IHF4bF9ibyB7CiAJdWludDMyX3Qgc3VyZmFjZV9pZDsKIAlzdHJ1Y3QgcXhsX3JlbGVhc2UgKnN1
cmZfY3JlYXRlOwogfTsKLSNkZWZpbmUgZ2VtX3RvX3F4bF9ibyhnb2JqKSBjb250YWluZXJfb2Yo
KGdvYmopLCBzdHJ1Y3QgcXhsX2JvLCBnZW1fYmFzZSkKKyNkZWZpbmUgZ2VtX3RvX3F4bF9ibyhn
b2JqKSBjb250YWluZXJfb2YoKGdvYmopLCBzdHJ1Y3QgcXhsX2JvLCB0Ym8uYmFzZSkKICNkZWZp
bmUgdG9fcXhsX2JvKHRvYmopIGNvbnRhaW5lcl9vZigodG9iaiksIHN0cnVjdCBxeGxfYm8sIHRi
bykKIAogc3RydWN0IHF4bF9nZW0gewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9x
eGxfb2JqZWN0LmggYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuaAppbmRleCAyNTVi
OTE0ZTJhN2IuLmI4MTJkNGFlOWQwZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9x
eGxfb2JqZWN0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmgKQEAgLTM0
LDcgKzM0LDcgQEAgc3RhdGljIGlubGluZSBpbnQgcXhsX2JvX3Jlc2VydmUoc3RydWN0IHF4bF9i
byAqYm8sIGJvb2wgbm9fd2FpdCkKIAlyID0gdHRtX2JvX3Jlc2VydmUoJmJvLT50Ym8sIHRydWUs
IG5vX3dhaXQsIE5VTEwpOwogCWlmICh1bmxpa2VseShyICE9IDApKSB7CiAJCWlmIChyICE9IC1F
UkVTVEFSVFNZUykgewotCQkJc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBiby0+Z2VtX2Jhc2Uu
ZGV2OworCQkJc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBiby0+dGJvLmJhc2UuZGV2OwogCiAJ
CQlkZXZfZXJyKGRkZXYtPmRldiwgIiVwIHJlc2VydmUgZmFpbGVkXG4iLCBibyk7CiAJCX0KQEAg
LTcxLDcgKzcxLDcgQEAgc3RhdGljIGlubGluZSBpbnQgcXhsX2JvX3dhaXQoc3RydWN0IHF4bF9i
byAqYm8sIHUzMiAqbWVtX3R5cGUsCiAJciA9IHR0bV9ib19yZXNlcnZlKCZiby0+dGJvLCB0cnVl
LCBub193YWl0LCBOVUxMKTsKIAlpZiAodW5saWtlbHkociAhPSAwKSkgewogCQlpZiAociAhPSAt
RVJFU1RBUlRTWVMpIHsKLQkJCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gYm8tPmdlbV9iYXNl
LmRldjsKKwkJCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gYm8tPnRiby5iYXNlLmRldjsKIAog
CQkJZGV2X2VycihkZGV2LT5kZXYsICIlcCByZXNlcnZlIGZhaWxlZCBmb3Igd2FpdFxuIiwKIAkJ
CQlibyk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9jbWQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX2NtZC5jCmluZGV4IGFjMTA4MWY1NWI1MS4uZWYwOWRjNmJjNjM1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9jbWQuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vcXhsL3F4bF9jbWQuYwpAQCAtMzc3LDcgKzM3Nyw3IEBAIHZvaWQgcXhsX2lvX2Rl
c3Ryb3lfcHJpbWFyeShzdHJ1Y3QgcXhsX2RldmljZSAqcWRldikKIHsKIAl3YWl0X2Zvcl9pb19j
bWQocWRldiwgMCwgUVhMX0lPX0RFU1RST1lfUFJJTUFSWV9BU1lOQyk7CiAJcWRldi0+cHJpbWFy
eV9iby0+aXNfcHJpbWFyeSA9IGZhbHNlOwotCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZCgm
cWRldi0+cHJpbWFyeV9iby0+Z2VtX2Jhc2UpOworCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tl
ZCgmcWRldi0+cHJpbWFyeV9iby0+dGJvLmJhc2UpOwogCXFkZXYtPnByaW1hcnlfYm8gPSBOVUxM
OwogfQogCkBAIC00MDQsNyArNDA0LDcgQEAgdm9pZCBxeGxfaW9fY3JlYXRlX3ByaW1hcnkoc3Ry
dWN0IHF4bF9kZXZpY2UgKnFkZXYsIHN0cnVjdCBxeGxfYm8gKmJvKQogCXdhaXRfZm9yX2lvX2Nt
ZChxZGV2LCAwLCBRWExfSU9fQ1JFQVRFX1BSSU1BUllfQVNZTkMpOwogCXFkZXYtPnByaW1hcnlf
Ym8gPSBibzsKIAlxZGV2LT5wcmltYXJ5X2JvLT5pc19wcmltYXJ5ID0gdHJ1ZTsKLQlkcm1fZ2Vt
X29iamVjdF9nZXQoJnFkZXYtPnByaW1hcnlfYm8tPmdlbV9iYXNlKTsKKwlkcm1fZ2VtX29iamVj
dF9nZXQoJnFkZXYtPnByaW1hcnlfYm8tPnRiby5iYXNlKTsKIH0KIAogdm9pZCBxeGxfaW9fbWVt
c2xvdF9hZGQoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYsIHVpbnQ4X3QgaWQpCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcXhs
L3F4bF9kZWJ1Z2ZzLmMKaW5kZXggYTg1ZWMxMDBiMGNjLi5iZGI1YWMwOTg3YWIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2RlYnVnZnMuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcXhsL3F4bF9kZWJ1Z2ZzLmMKQEAgLTY2LDcgKzY2LDcgQEAgcXhsX2RlYnVnZnNfYnVmZmVy
c19pbmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkKIAkJcmN1X3JlYWRfdW5sb2Nr
KCk7CiAKIAkJc2VxX3ByaW50ZihtLCAic2l6ZSAlbGQsIHBjICVkLCBudW0gcmVsZWFzZXMgJWRc
biIsCi0JCQkgICAodW5zaWduZWQgbG9uZyliby0+Z2VtX2Jhc2Uuc2l6ZSwKKwkJCSAgICh1bnNp
Z25lZCBsb25nKWJvLT50Ym8uYmFzZS5zaXplLAogCQkJICAgYm8tPnBpbl9jb3VudCwgcmVsKTsK
IAl9CiAJcmV0dXJuIDA7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kaXNw
bGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kaXNwbGF5LmMKaW5kZXggMDIzZmI1YTY5
YWYxLi4xNmQ3M2IyMmYzZjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rp
c3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kaXNwbGF5LmMKQEAgLTc5Nyw3
ICs3OTcsNyBAQCBzdGF0aWMgaW50IHF4bF9wbGFuZV9wcmVwYXJlX2ZiKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lLAogCQkgICAgcWRldi0+ZHVtYl9zaGFkb3dfYm8tPnN1cmYuaGVpZ2h0ICE9IHN1
cmYuaGVpZ2h0KSB7CiAJCQlpZiAocWRldi0+ZHVtYl9zaGFkb3dfYm8pIHsKIAkJCQlkcm1fZ2Vt
X29iamVjdF9wdXRfdW5sb2NrZWQKLQkJCQkJKCZxZGV2LT5kdW1iX3NoYWRvd19iby0+Z2VtX2Jh
c2UpOworCQkJCQkoJnFkZXYtPmR1bWJfc2hhZG93X2JvLT50Ym8uYmFzZSk7CiAJCQkJcWRldi0+
ZHVtYl9zaGFkb3dfYm8gPSBOVUxMOwogCQkJfQogCQkJcXhsX2JvX2NyZWF0ZShxZGV2LCBzdXJm
LmhlaWdodCAqIHN1cmYuc3RyaWRlLApAQCAtODA3LDEwICs4MDcsMTAgQEAgc3RhdGljIGludCBx
eGxfcGxhbmVfcHJlcGFyZV9mYihzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAkJaWYgKHVzZXJf
Ym8tPnNoYWRvdyAhPSBxZGV2LT5kdW1iX3NoYWRvd19ibykgewogCQkJaWYgKHVzZXJfYm8tPnNo
YWRvdykgewogCQkJCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZAotCQkJCQkoJnVzZXJfYm8t
PnNoYWRvdy0+Z2VtX2Jhc2UpOworCQkJCQkoJnVzZXJfYm8tPnNoYWRvdy0+dGJvLmJhc2UpOwog
CQkJCXVzZXJfYm8tPnNoYWRvdyA9IE5VTEw7CiAJCQl9Ci0JCQlkcm1fZ2VtX29iamVjdF9nZXQo
JnFkZXYtPmR1bWJfc2hhZG93X2JvLT5nZW1fYmFzZSk7CisJCQlkcm1fZ2VtX29iamVjdF9nZXQo
JnFkZXYtPmR1bWJfc2hhZG93X2JvLT50Ym8uYmFzZSk7CiAJCQl1c2VyX2JvLT5zaGFkb3cgPSBx
ZGV2LT5kdW1iX3NoYWRvd19ibzsKIAkJfQogCX0KQEAgLTg0MSw3ICs4NDEsNyBAQCBzdGF0aWMg
dm9pZCBxeGxfcGxhbmVfY2xlYW51cF9mYihzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAlxeGxf
Ym9fdW5waW4odXNlcl9ibyk7CiAKIAlpZiAob2xkX3N0YXRlLT5mYiAhPSBwbGFuZS0+c3RhdGUt
PmZiICYmIHVzZXJfYm8tPnNoYWRvdykgewotCQlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQo
JnVzZXJfYm8tPnNoYWRvdy0+Z2VtX2Jhc2UpOworCQlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2Nr
ZWQoJnVzZXJfYm8tPnNoYWRvdy0+dGJvLmJhc2UpOwogCQl1c2VyX2JvLT5zaGFkb3cgPSBOVUxM
OwogCX0KIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2dlbS5jIGIvZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfZ2VtLmMKaW5kZXggODllNGY5YTcyNDljLi42OWYzN2RiMTAy
N2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2dlbS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX2dlbS5jCkBAIC02Myw3ICs2Myw3IEBAIGludCBxeGxfZ2VtX29i
amVjdF9jcmVhdGUoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYsIGludCBzaXplLAogCQkJCSAgc2l6
ZSwgaW5pdGlhbF9kb21haW4sIGFsaWdubWVudCwgcik7CiAJCXJldHVybiByOwogCX0KLQkqb2Jq
ID0gJnFiby0+Z2VtX2Jhc2U7CisJKm9iaiA9ICZxYm8tPnRiby5iYXNlOwogCiAJbXV0ZXhfbG9j
aygmcWRldi0+Z2VtLm11dGV4KTsKIAlsaXN0X2FkZF90YWlsKCZxYm8tPmxpc3QsICZxZGV2LT5n
ZW0ub2JqZWN0cyk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3Qu
YyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jCmluZGV4IDQ5MjhmYTYwMjk0NC4u
NTQ4ZGZlNmYzYjI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3Qu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuYwpAQCAtMzMsMTQgKzMzLDE0
IEBAIHN0YXRpYyB2b2lkIHF4bF90dG1fYm9fZGVzdHJveShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKnRibykKIAlzdHJ1Y3QgcXhsX2RldmljZSAqcWRldjsKIAogCWJvID0gdG9fcXhsX2JvKHRi
byk7Ci0JcWRldiA9IChzdHJ1Y3QgcXhsX2RldmljZSAqKWJvLT5nZW1fYmFzZS5kZXYtPmRldl9w
cml2YXRlOworCXFkZXYgPSAoc3RydWN0IHF4bF9kZXZpY2UgKiliby0+dGJvLmJhc2UuZGV2LT5k
ZXZfcHJpdmF0ZTsKIAogCXF4bF9zdXJmYWNlX2V2aWN0KHFkZXYsIGJvLCBmYWxzZSk7CiAJV0FS
Tl9PTl9PTkNFKGJvLT5tYXBfY291bnQgPiAwKTsKIAltdXRleF9sb2NrKCZxZGV2LT5nZW0ubXV0
ZXgpOwogCWxpc3RfZGVsX2luaXQoJmJvLT5saXN0KTsKIAltdXRleF91bmxvY2soJnFkZXYtPmdl
bS5tdXRleCk7Ci0JZHJtX2dlbV9vYmplY3RfcmVsZWFzZSgmYm8tPmdlbV9iYXNlKTsKKwlkcm1f
Z2VtX29iamVjdF9yZWxlYXNlKCZiby0+dGJvLmJhc2UpOwogCWtmcmVlKGJvKTsKIH0KIApAQCAt
OTUsNyArOTUsNyBAQCBpbnQgcXhsX2JvX2NyZWF0ZShzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiwK
IAlpZiAoYm8gPT0gTlVMTCkKIAkJcmV0dXJuIC1FTk9NRU07CiAJc2l6ZSA9IHJvdW5kdXAoc2l6
ZSwgUEFHRV9TSVpFKTsKLQlyID0gZHJtX2dlbV9vYmplY3RfaW5pdCgmcWRldi0+ZGRldiwgJmJv
LT5nZW1fYmFzZSwgc2l6ZSk7CisJciA9IGRybV9nZW1fb2JqZWN0X2luaXQoJnFkZXYtPmRkZXYs
ICZiby0+dGJvLmJhc2UsIHNpemUpOwogCWlmICh1bmxpa2VseShyKSkgewogCQlrZnJlZShibyk7
CiAJCXJldHVybiByOwpAQCAtMjE0LDIwICsyMTQsMjAgQEAgdm9pZCBxeGxfYm9fdW5yZWYoc3Ry
dWN0IHF4bF9ibyAqKmJvKQogCWlmICgoKmJvKSA9PSBOVUxMKQogCQlyZXR1cm47CiAKLQlkcm1f
Z2VtX29iamVjdF9wdXRfdW5sb2NrZWQoJigqYm8pLT5nZW1fYmFzZSk7CisJZHJtX2dlbV9vYmpl
Y3RfcHV0X3VubG9ja2VkKCYoKmJvKS0+dGJvLmJhc2UpOwogCSpibyA9IE5VTEw7CiB9CiAKIHN0
cnVjdCBxeGxfYm8gKnF4bF9ib19yZWYoc3RydWN0IHF4bF9ibyAqYm8pCiB7Ci0JZHJtX2dlbV9v
YmplY3RfZ2V0KCZiby0+Z2VtX2Jhc2UpOworCWRybV9nZW1fb2JqZWN0X2dldCgmYm8tPnRiby5i
YXNlKTsKIAlyZXR1cm4gYm87CiB9CiAKIHN0YXRpYyBpbnQgX19xeGxfYm9fcGluKHN0cnVjdCBx
eGxfYm8gKmJvKQogewogCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHggPSB7IGZhbHNlLCBm
YWxzZSB9OwotCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gYm8tPmdlbV9iYXNlLmRldjsKKwlz
dHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IGJvLT50Ym8uYmFzZS5kZXY7CiAJaW50IHI7CiAKIAlp
ZiAoYm8tPnBpbl9jb3VudCkgewpAQCAtMjQ3LDcgKzI0Nyw3IEBAIHN0YXRpYyBpbnQgX19xeGxf
Ym9fcGluKHN0cnVjdCBxeGxfYm8gKmJvKQogc3RhdGljIGludCBfX3F4bF9ib191bnBpbihzdHJ1
Y3QgcXhsX2JvICpibykKIHsKIAlzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggY3R4ID0geyBmYWxz
ZSwgZmFsc2UgfTsKLQlzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IGJvLT5nZW1fYmFzZS5kZXY7
CisJc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBiby0+dGJvLmJhc2UuZGV2OwogCWludCByLCBp
OwogCiAJaWYgKCFiby0+cGluX2NvdW50KSB7CkBAIC0zMTAsMTMgKzMxMCwxMyBAQCB2b2lkIHF4
bF9ib19mb3JjZV9kZWxldGUoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYpCiAJZGV2X2VycihxZGV2
LT5kZGV2LmRldiwgIlVzZXJzcGFjZSBzdGlsbCBoYXMgYWN0aXZlIG9iamVjdHMgIVxuIik7CiAJ
bGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGJvLCBuLCAmcWRldi0+Z2VtLm9iamVjdHMsIGxpc3Qp
IHsKIAkJZGV2X2VycihxZGV2LT5kZGV2LmRldiwgIiVwICVwICVsdSAlbHUgZm9yY2UgZnJlZVxu
IiwKLQkJCSZiby0+Z2VtX2Jhc2UsIGJvLCAodW5zaWduZWQgbG9uZyliby0+Z2VtX2Jhc2Uuc2l6
ZSwKLQkJCSooKHVuc2lnbmVkIGxvbmcgKikmYm8tPmdlbV9iYXNlLnJlZmNvdW50KSk7CisJCQkm
Ym8tPnRiby5iYXNlLCBibywgKHVuc2lnbmVkIGxvbmcpYm8tPnRiby5iYXNlLnNpemUsCisJCQkq
KCh1bnNpZ25lZCBsb25nICopJmJvLT50Ym8uYmFzZS5yZWZjb3VudCkpOwogCQltdXRleF9sb2Nr
KCZxZGV2LT5nZW0ubXV0ZXgpOwogCQlsaXN0X2RlbF9pbml0KCZiby0+bGlzdCk7CiAJCW11dGV4
X3VubG9jaygmcWRldi0+Z2VtLm11dGV4KTsKIAkJLyogdGhpcyBzaG91bGQgdW5yZWYgdGhlIHR0
bSBibyAqLwotCQlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQoJmJvLT5nZW1fYmFzZSk7CisJ
CWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZCgmYm8tPnRiby5iYXNlKTsKIAl9CiB9CiAKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3JlbGVhc2UuYyBiL2RyaXZlcnMvZ3B1
L2RybS9xeGwvcXhsX3JlbGVhc2UuYwppbmRleCBiODA1YmZhODdiNjguLjAwMjJlMzFiYTkxMCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfcmVsZWFzZS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX3JlbGVhc2UuYwpAQCAtMjQzLDcgKzI0Myw3IEBAIHN0YXRpYyBp
bnQgcXhsX3JlbGVhc2VfdmFsaWRhdGVfYm8oc3RydWN0IHF4bF9ibyAqYm8pCiAJCXJldHVybiBy
ZXQ7CiAKIAkvKiBhbGxvY2F0ZSBhIHN1cmZhY2UgZm9yIHJlc2VydmVkICsgdmFsaWRhdGVkIGJ1
ZmZlcnMgKi8KLQlyZXQgPSBxeGxfYm9fY2hlY2tfaWQoYm8tPmdlbV9iYXNlLmRldi0+ZGV2X3By
aXZhdGUsIGJvKTsKKwlyZXQgPSBxeGxfYm9fY2hlY2tfaWQoYm8tPnRiby5iYXNlLmRldi0+ZGV2
X3ByaXZhdGUsIGJvKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCXJldHVybiAwOwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF90dG0uYwppbmRleCA2NjNlNTlmZDFlOGMuLjliMjQ1MTRjNzVhYSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4
bC9xeGxfdHRtLmMKQEAgLTE1NSw3ICsxNTUsNyBAQCBzdGF0aWMgaW50IHF4bF92ZXJpZnlfYWNj
ZXNzKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIHN0cnVjdCBmaWxlICpmaWxwKQogewog
CXN0cnVjdCBxeGxfYm8gKnFibyA9IHRvX3F4bF9ibyhibyk7CiAKLQlyZXR1cm4gZHJtX3ZtYV9u
b2RlX3ZlcmlmeV9hY2Nlc3MoJnFiby0+Z2VtX2Jhc2Uudm1hX25vZGUsCisJcmV0dXJuIGRybV92
bWFfbm9kZV92ZXJpZnlfYWNjZXNzKCZxYm8tPnRiby5iYXNlLnZtYV9ub2RlLAogCQkJCQkgIGZp
bHAtPnByaXZhdGVfZGF0YSk7CiB9CiAKQEAgLTI5Nyw3ICsyOTcsNyBAQCBzdGF0aWMgdm9pZCBx
eGxfYm9fbW92ZV9ub3RpZnkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAlpZiAoIXF4
bF90dG1fYm9faXNfcXhsX2JvKGJvKSkKIAkJcmV0dXJuOwogCXFibyA9IHRvX3F4bF9ibyhibyk7
Ci0JcWRldiA9IHFiby0+Z2VtX2Jhc2UuZGV2LT5kZXZfcHJpdmF0ZTsKKwlxZGV2ID0gcWJvLT50
Ym8uYmFzZS5kZXYtPmRldl9wcml2YXRlOwogCiAJaWYgKGJvLT5tZW0ubWVtX3R5cGUgPT0gVFRN
X1BMX1BSSVYgJiYgcWJvLT5zdXJmYWNlX2lkKQogCQlxeGxfc3VyZmFjZV9ldmljdChxZGV2LCBx
Ym8sIG5ld19tZW0gPyB0cnVlIDogZmFsc2UpOwotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
