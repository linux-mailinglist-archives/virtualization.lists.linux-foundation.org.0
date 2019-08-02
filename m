Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 058127EBF3
	for <lists.virtualization@lfdr.de>; Fri,  2 Aug 2019 07:23:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 53B641784;
	Fri,  2 Aug 2019 05:22:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 25269175F
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 05:22:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C7181712
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 05:22:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47EF2B59A0;
	Fri,  2 Aug 2019 05:22:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
	[10.36.116.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D470B19C68;
	Fri,  2 Aug 2019 05:22:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id CF7879D1F; Fri,  2 Aug 2019 07:22:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 15/17] drm/qxl: switch driver from bo->resv to bo->base.resv
Date: Fri,  2 Aug 2019 07:22:45 +0200
Message-Id: <20190802052247.18427-16-kraxel@redhat.com>
In-Reply-To: <20190802052247.18427-1-kraxel@redhat.com>
References: <20190802052247.18427-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 02 Aug 2019 05:22:55 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: thomas@shipmail.org, tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
	ckoenig.leichtzumerken@gmail.com, open list <linux-kernel@vger.kernel.org>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>, daniel@ffwll.ch,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>,
	Dave Airlie <airlied@redhat.com>, bskeggs@redhat.com
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
cy9ncHUvZHJtL3F4bC9xeGxfZGVidWdmcy5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL3F4bC9x
eGxfcmVsZWFzZS5jIHwgNiArKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rl
YnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2RlYnVnZnMuYwppbmRleCBiZGI1YWMw
OTg3YWIuLjk0NDM5MjEyYTVjNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxf
ZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2RlYnVnZnMuYwpAQCAtNjEs
NyArNjEsNyBAQCBxeGxfZGVidWdmc19idWZmZXJzX2luZm8oc3RydWN0IHNlcV9maWxlICptLCB2
b2lkICpkYXRhKQogCQlpbnQgcmVsOwogCiAJCXJjdV9yZWFkX2xvY2soKTsKLQkJZm9iaiA9IHJj
dV9kZXJlZmVyZW5jZShiby0+dGJvLnJlc3YtPmZlbmNlKTsKKwkJZm9iaiA9IHJjdV9kZXJlZmVy
ZW5jZShiby0+dGJvLmJhc2UucmVzdi0+ZmVuY2UpOwogCQlyZWwgPSBmb2JqID8gZm9iai0+c2hh
cmVkX2NvdW50IDogMDsKIAkJcmN1X3JlYWRfdW5sb2NrKCk7CiAKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX3JlbGVhc2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3Jl
bGVhc2UuYwppbmRleCAwMDIyZTMxYmE5MTAuLmRmNTViODNlMGE1NSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfcmVsZWFzZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwv
cXhsX3JlbGVhc2UuYwpAQCAtMjM4LDcgKzIzOCw3IEBAIHN0YXRpYyBpbnQgcXhsX3JlbGVhc2Vf
dmFsaWRhdGVfYm8oc3RydWN0IHF4bF9ibyAqYm8pCiAJCQlyZXR1cm4gcmV0OwogCX0KIAotCXJl
dCA9IHJlc2VydmF0aW9uX29iamVjdF9yZXNlcnZlX3NoYXJlZChiby0+dGJvLnJlc3YsIDEpOwor
CXJldCA9IHJlc2VydmF0aW9uX29iamVjdF9yZXNlcnZlX3NoYXJlZChiby0+dGJvLmJhc2UucmVz
diwgMSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIApAQCAtNDU4LDkgKzQ1OCw5IEBAIHZv
aWQgcXhsX3JlbGVhc2VfZmVuY2VfYnVmZmVyX29iamVjdHMoc3RydWN0IHF4bF9yZWxlYXNlICpy
ZWxlYXNlKQogCWxpc3RfZm9yX2VhY2hfZW50cnkoZW50cnksICZyZWxlYXNlLT5ib3MsIGhlYWQp
IHsKIAkJYm8gPSBlbnRyeS0+Ym87CiAKLQkJcmVzZXJ2YXRpb25fb2JqZWN0X2FkZF9zaGFyZWRf
ZmVuY2UoYm8tPnJlc3YsICZyZWxlYXNlLT5iYXNlKTsKKwkJcmVzZXJ2YXRpb25fb2JqZWN0X2Fk
ZF9zaGFyZWRfZmVuY2UoYm8tPmJhc2UucmVzdiwgJnJlbGVhc2UtPmJhc2UpOwogCQl0dG1fYm9f
YWRkX3RvX2xydShibyk7Ci0JCXJlc2VydmF0aW9uX29iamVjdF91bmxvY2soYm8tPnJlc3YpOwor
CQlyZXNlcnZhdGlvbl9vYmplY3RfdW5sb2NrKGJvLT5iYXNlLnJlc3YpOwogCX0KIAlzcGluX3Vu
bG9jaygmZ2xvYi0+bHJ1X2xvY2spOwogCXd3X2FjcXVpcmVfZmluaSgmcmVsZWFzZS0+dGlja2V0
KTsKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
