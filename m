Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D31596C1
	for <lists.virtualization@lfdr.de>; Fri, 28 Jun 2019 11:03:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7D362B50;
	Fri, 28 Jun 2019 09:03:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EC5C3AC8
	for <virtualization@lists.linux-foundation.org>;
	Fri, 28 Jun 2019 09:03:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9E2C682F
	for <virtualization@lists.linux-foundation.org>;
	Fri, 28 Jun 2019 09:03:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D3FC309264C;
	Fri, 28 Jun 2019 09:03:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
	[10.36.116.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 129051A930;
	Fri, 28 Jun 2019 09:03:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 8D0659D7C; Fri, 28 Jun 2019 11:03:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 17/18] drm/virtio: switch driver from bo->resv to
	bo->base.resv
Date: Fri, 28 Jun 2019 11:03:02 +0200
Message-Id: <20190628090303.29467-18-kraxel@redhat.com>
In-Reply-To: <20190628090303.29467-1-kraxel@redhat.com>
References: <20190628090303.29467-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 28 Jun 2019 09:03:20 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: thomas@shipmail.org, tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
	ckoenig.leichtzumerken@gmail.com, open list <linux-kernel@vger.kernel.org>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, daniel@ffwll.ch,
	bskeggs@redhat.com
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

U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkFja2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X2lvY3RsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9j
dGwuYwppbmRleCBhYzYwYmU5YjVjMTkuLjRhZGZjZWQ4ZGYyYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X2lvY3RsLmMKQEAgLTM5NCw3ICszOTQsNyBAQCBzdGF0aWMgaW50IHZpcnRp
b19ncHVfdHJhbnNmZXJfZnJvbV9ob3N0X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJ
CSh2Z2RldiwgcW9iai0+aHdfcmVzX2hhbmRsZSwKIAkJIHZmcHJpdi0+Y3R4X2lkLCBvZmZzZXQs
IGFyZ3MtPmxldmVsLAogCQkgJmJveCwgZmVuY2UpOwotCXJlc2VydmF0aW9uX29iamVjdF9hZGRf
ZXhjbF9mZW5jZShxb2JqLT50Ym8ucmVzdiwKKwlyZXNlcnZhdGlvbl9vYmplY3RfYWRkX2V4Y2xf
ZmVuY2UocW9iai0+dGJvLmJhc2UucmVzdiwKIAkJCQkJICAmZmVuY2UtPmYpOwogCiAJZG1hX2Zl
bmNlX3B1dCgmZmVuY2UtPmYpOwpAQCAtNDQ4LDcgKzQ0OCw3IEBAIHN0YXRpYyBpbnQgdmlydGlv
X2dwdV90cmFuc2Zlcl90b19ob3N0X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQg
KmRhdGEsCiAJCQkodmdkZXYsIHFvYmosCiAJCQkgdmZwcml2ID8gdmZwcml2LT5jdHhfaWQgOiAw
LCBvZmZzZXQsCiAJCQkgYXJncy0+bGV2ZWwsICZib3gsIGZlbmNlKTsKLQkJcmVzZXJ2YXRpb25f
b2JqZWN0X2FkZF9leGNsX2ZlbmNlKHFvYmotPnRiby5yZXN2LAorCQlyZXNlcnZhdGlvbl9vYmpl
Y3RfYWRkX2V4Y2xfZmVuY2UocW9iai0+dGJvLmJhc2UucmVzdiwKIAkJCQkJCSAgJmZlbmNlLT5m
KTsKIAkJZG1hX2ZlbmNlX3B1dCgmZmVuY2UtPmYpOwogCX0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X3BsYW5lLmMKaW5kZXggMDI0YzJhYTBjOTI5Li4zMjhlMjgwODFkOWYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jCkBAIC0yMTAsNyArMjEwLDcgQEAgc3RhdGlj
IHZvaWQgdmlydGlvX2dwdV9jdXJzb3JfcGxhbmVfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBs
YW5lLAogCQkJIDAsIDAsIHZnZmItPmZlbmNlKTsKIAkJcmV0ID0gdmlydGlvX2dwdV9vYmplY3Rf
cmVzZXJ2ZShibywgZmFsc2UpOwogCQlpZiAoIXJldCkgewotCQkJcmVzZXJ2YXRpb25fb2JqZWN0
X2FkZF9leGNsX2ZlbmNlKGJvLT50Ym8ucmVzdiwKKwkJCXJlc2VydmF0aW9uX29iamVjdF9hZGRf
ZXhjbF9mZW5jZShiby0+dGJvLmJhc2UucmVzdiwKIAkJCQkJCQkgICZ2Z2ZiLT5mZW5jZS0+Zik7
CiAJCQlkbWFfZmVuY2VfcHV0KCZ2Z2ZiLT5mZW5jZS0+Zik7CiAJCQl2Z2ZiLT5mZW5jZSA9IE5V
TEw7Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
