Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EED229C6E
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 82C2C86B10;
	Wed, 22 Jul 2020 16:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQNITHcZtyhZ; Wed, 22 Jul 2020 16:01:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2238386B85;
	Wed, 22 Jul 2020 16:01:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DF78C004C;
	Wed, 22 Jul 2020 16:01:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2185C004E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B993986AE9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WjsKyouxy3-P
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8383086AE3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:33 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 ECA03305D7D0; Wed, 22 Jul 2020 19:01:31 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id E12943072786;
 Wed, 22 Jul 2020 19:01:31 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 02/34] KVM: x86: export .get_eptp_switching_status()
Date: Wed, 22 Jul 2020 19:00:49 +0300
Message-Id: <20200722160121.9601-3-alazar@bitdefender.com>
In-Reply-To: <20200722160121.9601-1-alazar@bitdefender.com>
References: <20200722160121.9601-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marian Rotariu <marian.c.rotariu@gmail.com>,
 =?UTF-8?q?=C8=98tefan=20=C8=98icleru?= <ssicleru@bitdefender.com>,
 virtualization@lists.linux-foundation.org
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

RnJvbTogTWFyaWFuIFJvdGFyaXUgPG1hcmlhbi5jLnJvdGFyaXVAZ21haWwuY29tPgoKVGhlIGlu
dHJvc3BlY3Rpb24gdG9vbCB1c2VzIHRoaXMgZnVuY3Rpb24gdG8gY2hlY2sgdGhlIGhhcmR3YXJl
IHN1cHBvcnQKZm9yIEVQVCBzd2l0Y2hpbmcsIHdoaWNoIGNhbiBiZSB1c2VkIGVpdGhlciB0byBz
aW5nbGVzdGVwIHZDUFVzCm9uIGEgdW5wcm90ZWN0ZWQgRVBUIHZpZXcgb3IgdG8gdXNlICNWRSBp
biBvcmRlciB0byBhdm9pZCBmaWx0ZXIgb3V0ClZNLWV4aXRzIGNhdXNlZCBieSBFUFQgdmlvbGF0
aW9ucy4KClNpZ25lZC1vZmYtYnk6IE1hcmlhbiBSb3Rhcml1IDxtYXJpYW4uYy5yb3Rhcml1QGdt
YWlsLmNvbT4KQ28tZGV2ZWxvcGVkLWJ5OiDImHRlZmFuIMiYaWNsZXJ1IDxzc2ljbGVydUBiaXRk
ZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IMiYdGVmYW4gyJhpY2xlcnUgPHNzaWNsZXJ1QGJp
dGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0
ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAyICsr
CiBhcmNoL3g4Ni9rdm0vdm14L2NhcGFiaWxpdGllcy5oIHwgOCArKysrKysrKwogYXJjaC94ODYv
a3ZtL3ZteC92bXguYyAgICAgICAgICB8IDggKysrKysrKysKIGFyY2gveDg2L2t2bS94ODYuYyAg
ICAgICAgICAgICAgfCAzICsrKwogNCBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL2t2bV9ob3N0LmgKaW5kZXggYWI2OTg5NzQ1ZjljLi41ZWIyNjEzNWU4MWIgMTAw
NjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIvYXJjaC94ODYv
aW5jbHVkZS9hc20va3ZtX2hvc3QuaApAQCAtMTMwMSw2ICsxMzAxLDcgQEAgc3RydWN0IGt2bV94
ODZfb3BzIHsKIAlib29sICgqZ3B0X3RyYW5zbGF0aW9uX2ZhdWx0KShzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpOwogCXZvaWQgKCpjb250cm9sX3NpbmdsZXN0ZXApKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgYm9vbCBlbmFibGUpOwogCWJvb2wgKCpnZXRfdm1mdW5jX3N0YXR1cykodm9pZCk7CisJYm9v
bCAoKmdldF9lcHRwX3N3aXRjaGluZ19zdGF0dXMpKHZvaWQpOwogfTsKIAogc3RydWN0IGt2bV94
ODZfbmVzdGVkX29wcyB7CkBAIC0xNDIyLDYgKzE0MjMsNyBAQCBleHRlcm4gdTY0ICBrdm1fbWF4
X3RzY19zY2FsaW5nX3JhdGlvOwogZXh0ZXJuIHU2NCAga3ZtX2RlZmF1bHRfdHNjX3NjYWxpbmdf
cmF0aW87CiAKIGV4dGVybiB1NjQga3ZtX21jZV9jYXBfc3VwcG9ydGVkOworZXh0ZXJuIGJvb2wg
a3ZtX2VwdHBfc3dpdGNoaW5nX3N1cHBvcnRlZDsKIAogLyoKICAqIEVNVUxUWVBFX05PX0RFQ09E
RSAtIFNldCB3aGVuIHJlLWVtdWxhdGluZyBhbiBpbnN0cnVjdGlvbiAoYWZ0ZXIgY29tcGxldGlu
ZwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3ZteC9jYXBhYmlsaXRpZXMuaCBiL2FyY2gveDg2
L2t2bS92bXgvY2FwYWJpbGl0aWVzLmgKaW5kZXggZTdkN2ZjYjdlMTdmLi45Mjc4MWUyYzUyM2Ug
MTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS92bXgvY2FwYWJpbGl0aWVzLmgKKysrIGIvYXJjaC94
ODYva3ZtL3ZteC9jYXBhYmlsaXRpZXMuaApAQCAtMjE5LDYgKzIxOSwxNCBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wgY3B1X2hhc192bXhfdm1mdW5jKHZvaWQpCiAJCVNFQ09OREFSWV9FWEVDX0VOQUJM
RV9WTUZVTkM7CiB9CiAKK3N0YXRpYyBpbmxpbmUgYm9vbCBjcHVfaGFzX3ZteF9lcHRwX3N3aXRj
aGluZyh2b2lkKQoreworCXU2NCB2bXhfbXNyOworCisJcmRtc3JsKE1TUl9JQTMyX1ZNWF9WTUZV
TkMsIHZteF9tc3IpOworCXJldHVybiB2bXhfbXNyICYgVk1YX1ZNRlVOQ19FUFRQX1NXSVRDSElO
RzsKK30KKwogc3RhdGljIGlubGluZSBib29sIGNwdV9oYXNfdm14X3NoYWRvd192bWNzKHZvaWQp
CiB7CiAJdTY0IHZteF9tc3I7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jIGIv
YXJjaC94ODYva3ZtL3ZteC92bXguYwppbmRleCBlYzQzOTZkNWYzNmYuLmNjYmY1NjFiMGZjNCAx
MDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXguYworKysgYi9hcmNoL3g4Ni9rdm0vdm14
L3ZteC5jCkBAIC03OTk3LDYgKzc5OTcsMTEgQEAgc3RhdGljIGJvb2wgdm14X2dldF92bWZ1bmNf
c3RhdHVzKHZvaWQpCiAJcmV0dXJuIGNwdV9oYXNfdm14X3ZtZnVuYygpOwogfQogCitzdGF0aWMg
Ym9vbCB2bXhfZ2V0X2VwdHBfc3dpdGNoaW5nX3N0YXR1cyh2b2lkKQoreworCXJldHVybiBrdm1f
ZXB0cF9zd2l0Y2hpbmdfc3VwcG9ydGVkOworfQorCiBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3Bz
IHZteF94ODZfb3BzIF9faW5pdGRhdGEgPSB7CiAJLmhhcmR3YXJlX3Vuc2V0dXAgPSBoYXJkd2Fy
ZV91bnNldHVwLAogCkBAIC04MTM5LDYgKzgxNDQsNyBAQCBzdGF0aWMgc3RydWN0IGt2bV94ODZf
b3BzIHZteF94ODZfb3BzIF9faW5pdGRhdGEgPSB7CiAJLmdwdF90cmFuc2xhdGlvbl9mYXVsdCA9
IHZteF9ncHRfdHJhbnNsYXRpb25fZmF1bHQsCiAJLmNvbnRyb2xfc2luZ2xlc3RlcCA9IHZteF9j
b250cm9sX3NpbmdsZXN0ZXAsCiAJLmdldF92bWZ1bmNfc3RhdHVzID0gdm14X2dldF92bWZ1bmNf
c3RhdHVzLAorCS5nZXRfZXB0cF9zd2l0Y2hpbmdfc3RhdHVzID0gdm14X2dldF9lcHRwX3N3aXRj
aGluZ19zdGF0dXMsCiB9OwogCiBzdGF0aWMgX19pbml0IGludCBoYXJkd2FyZV9zZXR1cCh2b2lk
KQpAQCAtODE3OCw2ICs4MTg0LDggQEAgc3RhdGljIF9faW5pdCBpbnQgaGFyZHdhcmVfc2V0dXAo
dm9pZCkKIAkgICAgIWNwdV9oYXNfdm14X2ludmVwdF9nbG9iYWwoKSkKIAkJZW5hYmxlX2VwdCA9
IDA7CiAKKwlrdm1fZXB0cF9zd2l0Y2hpbmdfc3VwcG9ydGVkID0gY3B1X2hhc192bXhfZXB0cF9z
d2l0Y2hpbmcoKTsKKwogCWlmICghY3B1X2hhc192bXhfZXB0X2FkX2JpdHMoKSB8fCAhZW5hYmxl
X2VwdCkKIAkJZW5hYmxlX2VwdF9hZF9iaXRzID0gMDsKIApkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
a3ZtL3g4Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jCmluZGV4IGZlYjIwYjI5YmI5Mi4uYjE2YjAx
OGM3NGNjIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94ODYva3Zt
L3g4Ni5jCkBAIC0xNjEsNiArMTYxLDkgQEAgbW9kdWxlX3BhcmFtKGZvcmNlX2VtdWxhdGlvbl9w
cmVmaXgsIGJvb2wsIFNfSVJVR08pOwogaW50IF9fcmVhZF9tb3N0bHkgcGlfaW5qZWN0X3RpbWVy
ID0gLTE7CiBtb2R1bGVfcGFyYW0ocGlfaW5qZWN0X3RpbWVyLCBiaW50LCBTX0lSVUdPIHwgU19J
V1VTUik7CiAKK2Jvb2wgX19yZWFkX21vc3RseSBrdm1fZXB0cF9zd2l0Y2hpbmdfc3VwcG9ydGVk
OworRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX2VwdHBfc3dpdGNoaW5nX3N1cHBvcnRlZCk7CisKICNk
ZWZpbmUgS1ZNX05SX1NIQVJFRF9NU1JTIDE2CiAKIHN0cnVjdCBrdm1fc2hhcmVkX21zcnNfZ2xv
YmFsIHsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
