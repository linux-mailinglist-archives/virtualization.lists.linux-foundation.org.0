Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED0E2C3C66
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 10:42:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EEA9A874AF;
	Wed, 25 Nov 2020 09:42:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9WbMkn+n6O-Q; Wed, 25 Nov 2020 09:42:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9EEE1874C1;
	Wed, 25 Nov 2020 09:42:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CC29C0052;
	Wed, 25 Nov 2020 09:42:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F978C1836
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9B31A869DE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:42:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8i9uoEEX4c6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D24E18698F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 6A508305D462; Wed, 25 Nov 2020 11:35:49 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 487D03072785;
 Wed, 25 Nov 2020 11:35:49 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v10 41/81] KVM: introspection: add KVMI_VM_CONTROL_EVENTS
Date: Wed, 25 Nov 2020 11:35:20 +0200
Message-Id: <20201125093600.2766-42-alazar@bitdefender.com>
In-Reply-To: <20201125093600.2766-1-alazar@bitdefender.com>
References: <20201125093600.2766-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtualization@lists.linux-foundation.org
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

QnkgZGVmYXVsdCwgYWxsIGludHJvc3BlY3Rpb24gVk0gZXZlbnRzIGFyZSBkaXNhYmxlZC4gVGhl
IGludHJvc3BlY3Rpb24KdG9vbCBtdXN0IGV4cGxpY2l0bHkgZW5hYmxlIHRoZSBWTSBldmVudHMg
aXQgd2FudHMgdG8gcmVjZWl2ZS4gV2l0aCB0aGlzCmNvbW1hbmQgaXQgY2FuIGVuYWJsZS9kaXNh
YmxlIGFueSBWTSBldmVudCAoZS5nLiBLVk1JX1ZNX0VWRU5UX1VOSE9PSykKaWYgYWxsb3dlZCBi
eSB0aGUgZGV2aWNlIG1hbmFnZXIuCgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFs
YXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJz
dCAgICAgICAgICAgICAgIHwgNDIgKysrKysrKysrKysrKystLQogaW5jbHVkZS9saW51eC9rdm1p
X2hvc3QuaCAgICAgICAgICAgICAgICAgICAgIHwgIDIgKwogaW5jbHVkZS91YXBpL2xpbnV4L2t2
bWkuaCAgICAgICAgICAgICAgICAgICAgIHwgMTYgKysrKystLQogLi4uL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMgIHwgNDggKysrKysrKysrKysrKysrKysrKwogdmly
dC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMgICAgICAgICAgICAgICAgIHwgMzAgKysrKysrKysr
KystCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmggICAgICAgICAgICAgfCAgMyAr
KwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jICAgICAgICAgICAgIHwgMjkgKysr
KysrKysrLS0KIDcgZmlsZXMgY2hhbmdlZCwgMTU4IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QgYi9Eb2N1
bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CmluZGV4IGU5YzQwYzdhZTE1NC4uYjRjZTdkYjMy
MTUwIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CisrKyBiL0Rv
Y3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKQEAgLTMzMiwxMCArMzMyLDQ0IEBAIFRoaXMg
Y29tbWFuZCBpcyBhbHdheXMgYWxsb3dlZC4KIAogUmV0dXJucyB0aGUgbnVtYmVyIG9mIG9ubGlu
ZSB2Q1BVcy4KIAorNS4gS1ZNSV9WTV9DT05UUk9MX0VWRU5UUworLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQorCis6QXJjaGl0ZWN0dXJlczogYWxsCis6VmVyc2lvbnM6ID49IDEKKzpQYXJhbWV0
ZXJzOgorCis6OgorCisJc3RydWN0IGt2bWlfdm1fY29udHJvbF9ldmVudHMgeworCQlfX3UxNiBl
dmVudF9pZDsKKwkJX191OCBlbmFibGU7CisJCV9fdTggcGFkZGluZzE7CisJCV9fdTMyIHBhZGRp
bmcyOworCX07CisKKzpSZXR1cm5zOgorCis6OgorCisJc3RydWN0IGt2bWlfZXJyb3JfY29kZQor
CitFbmFibGVzL2Rpc2FibGVzIFZNIGludHJvc3BlY3Rpb24gZXZlbnRzLiBUaGlzIGNvbW1hbmQg
Y2FuIGJlIHVzZWQgd2l0aAordGhlIGZvbGxvd2luZyBldmVudHM6OgorCisJS1ZNSV9WTV9FVkVO
VF9VTkhPT0sKKworOkVycm9yczoKKworKiAtS1ZNX0VJTlZBTCAtIHRoZSBwYWRkaW5nIGlzIG5v
dCB6ZXJvCisqIC1LVk1fRUlOVkFMIC0gdGhlIGV2ZW50IElEIGlzIHVua25vd24gKHVzZSAqS1ZN
SV9WTV9DSEVDS19FVkVOVCogZmlyc3QpCisqIC1LVk1fRVBFUk0gLSB0aGUgYWNjZXNzIGlzIGRp
c2FsbG93ZWQgKHVzZSAqS1ZNSV9WTV9DSEVDS19FVkVOVCogZmlyc3QpCisKIEV2ZW50cwogPT09
PT09CiAKIFRoZSBWTSBpbnRyb3NwZWN0aW9uIGV2ZW50cyBhcmUgc2VudCB1c2luZyB0aGUgS1ZN
SV9WTV9FVkVOVCBtZXNzYWdlIGlkLgorTm8gZXZlbnQgaXMgc2VudCB1bmxlc3MgaXQgaXMgZXhw
bGljaXRseSBlbmFibGVkLgogVGhlIG1lc3NhZ2UgZGF0YSBiZWdpbnMgd2l0aCBhIGNvbW1vbiBz
dHJ1Y3R1cmUgaGF2aW5nIHRoZSBldmVudCBpZDo6CiAKIAlzdHJ1Y3Qga3ZtaV9ldmVudF9oZHIg
ewpAQCAtMzU5LDYgKzM5Myw4IEBAIFNwZWNpZmljIGV2ZW50IGRhdGEgY2FuIGZvbGxvdyB0aGlz
IGNvbW1vbiBzdHJ1Y3R1cmUuCiAKIDpSZXR1cm5zOiBub25lCiAKLVRoaXMgZXZlbnQgaXMgc2Vu
dCB3aGVuIHRoZSBkZXZpY2UgbWFuYWdlciBoYXMgdG8gcGF1c2Uvc3RvcC9taWdyYXRlIHRoZQot
Z3Vlc3QgKHNlZSAqKlVuaG9va2luZyoqKS4gIFRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgaGFzIGEg
Y2hhbmNlIHRvIHVuaG9vawotYW5kIGNsb3NlIHRoZSBLVk1JIGNoYW5uZWwgKHNpZ25hbGluZyB0
aGF0IHRoZSBvcGVyYXRpb24gY2FuIHByb2NlZWQpLgorVGhpcyBldmVudCBpcyBzZW50IHdoZW4g
dGhlIGRldmljZSBtYW5hZ2VyIGhhcyB0byBwYXVzZS9zdG9wL21pZ3JhdGUKK3RoZSBndWVzdCAo
c2VlICoqVW5ob29raW5nKiopIGFuZCB0aGUgaW50cm9zcGVjdGlvbiBoYXMgYmVlbiBlbmFibGVk
IGZvcgordGhpcyBldmVudCAoc2VlICoqS1ZNSV9WTV9DT05UUk9MX0VWRU5UUyoqKS4gVGhlIGlu
dHJvc3BlY3Rpb24gdG9vbCBoYXMKK2EgY2hhbmNlIHRvIHVuaG9vayBhbmQgY2xvc2UgdGhlIGlu
dHJvc3BlY3Rpb24gc29ja2V0IChzaWduYWxpbmcgdGhhdAordGhlIG9wZXJhdGlvbiBjYW4gcHJv
Y2VlZCkuCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5oIGIvaW5jbHVkZS9s
aW51eC9rdm1pX2hvc3QuaAppbmRleCA2NDc2YzdkNmE0ZDMuLmE1OTMwN2RhYzZiZiAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaAorKysgYi9pbmNsdWRlL2xpbnV4L2t2bWlf
aG9zdC5oCkBAIC0xOCw2ICsxOCw4IEBAIHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiB7CiAJdW5z
aWduZWQgbG9uZyAqY21kX2FsbG93X21hc2s7CiAJdW5zaWduZWQgbG9uZyAqZXZlbnRfYWxsb3df
bWFzazsKIAorCXVuc2lnbmVkIGxvbmcgKnZtX2V2ZW50X2VuYWJsZV9tYXNrOworCiAJYXRvbWlj
X3QgZXZfc2VxOwogfTsKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCBi
L2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKaW5kZXggMThmYjUxMDc4ZDQ4Li45YTEwZWYyY2Q4
OTAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKKysrIGIvaW5jbHVkZS91
YXBpL2xpbnV4L2t2bWkuaApAQCAtMTksMTAgKzE5LDExIEBAIGVudW0gewogZW51bSB7CiAJS1ZN
SV9WTV9FVkVOVCA9IEtWTUlfVk1fTUVTU0FHRV9JRCgwKSwKIAotCUtWTUlfR0VUX1ZFUlNJT04g
ICAgICA9IEtWTUlfVk1fTUVTU0FHRV9JRCgxKSwKLQlLVk1JX1ZNX0NIRUNLX0NPTU1BTkQgPSBL
Vk1JX1ZNX01FU1NBR0VfSUQoMiksCi0JS1ZNSV9WTV9DSEVDS19FVkVOVCAgID0gS1ZNSV9WTV9N
RVNTQUdFX0lEKDMpLAotCUtWTUlfVk1fR0VUX0lORk8gICAgICA9IEtWTUlfVk1fTUVTU0FHRV9J
RCg0KSwKKwlLVk1JX0dFVF9WRVJTSU9OICAgICAgID0gS1ZNSV9WTV9NRVNTQUdFX0lEKDEpLAor
CUtWTUlfVk1fQ0hFQ0tfQ09NTUFORCAgPSBLVk1JX1ZNX01FU1NBR0VfSUQoMiksCisJS1ZNSV9W
TV9DSEVDS19FVkVOVCAgICA9IEtWTUlfVk1fTUVTU0FHRV9JRCgzKSwKKwlLVk1JX1ZNX0dFVF9J
TkZPICAgICAgID0gS1ZNSV9WTV9NRVNTQUdFX0lEKDQpLAorCUtWTUlfVk1fQ09OVFJPTF9FVkVO
VFMgPSBLVk1JX1ZNX01FU1NBR0VfSUQoNSksCiAKIAlLVk1JX05FWFRfVk1fTUVTU0FHRQogfTsK
QEAgLTgyLDQgKzgzLDExIEBAIHN0cnVjdCBrdm1pX2V2ZW50X2hkciB7CiAJX191MTYgcGFkZGlu
Z1szXTsKIH07CiAKK3N0cnVjdCBrdm1pX3ZtX2NvbnRyb2xfZXZlbnRzIHsKKwlfX3UxNiBldmVu
dF9pZDsKKwlfX3U4IGVuYWJsZTsKKwlfX3U4IHBhZGRpbmcxOworCV9fdTMyIHBhZGRpbmcyOwor
fTsKKwogI2VuZGlmIC8qIF9VQVBJX19MSU5VWF9LVk1JX0ggKi8KZGlmZiAtLWdpdCBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jCmluZGV4IDAxYjI2MDM3OWMyYS4uNDMw
Njg1YTMzNzFlIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0
L2t2bWlfdGVzdC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3Zt
aV90ZXN0LmMKQEAgLTMzMiw2ICszMzIsMzEgQEAgc3RhdGljIHZvaWQgdHJpZ2dlcl9ldmVudF91
bmhvb2tfbm90aWZpY2F0aW9uKHN0cnVjdCBrdm1fdm0gKnZtKQogCQllcnJubywgc3RyZXJyb3Io
ZXJybm8pKTsKIH0KIAorc3RhdGljIHZvaWQgY21kX3ZtX2NvbnRyb2xfZXZlbnRzKF9fdTE2IGV2
ZW50X2lkLCBfX3U4IGVuYWJsZSwKKwkJCQkgIGludCBleHBlY3RlZF9lcnIpCit7CisJc3RydWN0
IHsKKwkJc3RydWN0IGt2bWlfbXNnX2hkciBoZHI7CisJCXN0cnVjdCBrdm1pX3ZtX2NvbnRyb2xf
ZXZlbnRzIGNtZDsKKwl9IHJlcSA9IHt9OworCisJcmVxLmNtZC5ldmVudF9pZCA9IGV2ZW50X2lk
OworCXJlcS5jbWQuZW5hYmxlID0gZW5hYmxlOworCisJdGVzdF92bV9jb21tYW5kKEtWTUlfVk1f
Q09OVFJPTF9FVkVOVFMsICZyZXEuaGRyLCBzaXplb2YocmVxKSwKKwkJCU5VTEwsIDAsIGV4cGVj
dGVkX2Vycik7Cit9CisKK3N0YXRpYyB2b2lkIGVuYWJsZV92bV9ldmVudChfX3UxNiBldmVudF9p
ZCkKK3sKKwljbWRfdm1fY29udHJvbF9ldmVudHMoZXZlbnRfaWQsIDEsIDApOworfQorCitzdGF0
aWMgdm9pZCBkaXNhYmxlX3ZtX2V2ZW50KF9fdTE2IGV2ZW50X2lkKQoreworCWNtZF92bV9jb250
cm9sX2V2ZW50cyhldmVudF9pZCwgMCwgMCk7Cit9CisKIHN0YXRpYyB2b2lkIHJlY2VpdmVfZXZl
bnQoc3RydWN0IGt2bWlfbXNnX2hkciAqbXNnX2hkciwgdTE2IG1zZ19pZCwKIAkJCSAgc3RydWN0
IGt2bWlfZXZlbnRfaGRyICpldl9oZHIsIHUxNiBldmVudF9pZCwKIAkJCSAgc2l6ZV90IGV2X3Np
emUpCkBAIC0zNjgsOSArMzkzLDMxIEBAIHN0YXRpYyB2b2lkIHJlY2VpdmVfdm1fZXZlbnRfdW5o
b29rKHZvaWQpCiAKIHN0YXRpYyB2b2lkIHRlc3RfZXZlbnRfdW5ob29rKHN0cnVjdCBrdm1fdm0g
KnZtKQogeworCXUxNiBpZCA9IEtWTUlfVk1fRVZFTlRfVU5IT09LOworCisJZW5hYmxlX3ZtX2V2
ZW50KGlkKTsKKwogCXRyaWdnZXJfZXZlbnRfdW5ob29rX25vdGlmaWNhdGlvbih2bSk7CiAKIAly
ZWNlaXZlX3ZtX2V2ZW50X3VuaG9vaygpOworCisJZGlzYWJsZV92bV9ldmVudChpZCk7Cit9CisK
K3N0YXRpYyB2b2lkIHRlc3RfY21kX3ZtX2NvbnRyb2xfZXZlbnRzKHN0cnVjdCBrdm1fdm0gKnZt
KQoreworCV9fdTE2IGlkID0gS1ZNSV9WTV9FVkVOVF9VTkhPT0ssIGludmFsaWRfaWQgPSAweGZm
ZmY7CisJX191OCBlbmFibGUgPSAxLCBlbmFibGVfaW52YWwgPSAyOworCisJZW5hYmxlX3ZtX2V2
ZW50KGlkKTsKKwlkaXNhYmxlX3ZtX2V2ZW50KGlkKTsKKworCWNtZF92bV9jb250cm9sX2V2ZW50
cyhpZCwgZW5hYmxlX2ludmFsLCAtS1ZNX0VJTlZBTCk7CisJY21kX3ZtX2NvbnRyb2xfZXZlbnRz
KGludmFsaWRfaWQsIGVuYWJsZSwgLUtWTV9FSU5WQUwpOworCisJZGlzYWxsb3dfZXZlbnQodm0s
IGlkKTsKKwljbWRfdm1fY29udHJvbF9ldmVudHMoaWQsIGVuYWJsZSwgLUtWTV9FUEVSTSk7CisJ
YWxsb3dfZXZlbnQodm0sIGlkKTsKIH0KIAogc3RhdGljIHZvaWQgdGVzdF9pbnRyb3NwZWN0aW9u
KHN0cnVjdCBrdm1fdm0gKnZtKQpAQCAtMzg0LDYgKzQzMSw3IEBAIHN0YXRpYyB2b2lkIHRlc3Rf
aW50cm9zcGVjdGlvbihzdHJ1Y3Qga3ZtX3ZtICp2bSkKIAl0ZXN0X2NtZF92bV9jaGVja19ldmVu
dCh2bSk7CiAJdGVzdF9jbWRfdm1fZ2V0X2luZm8oKTsKIAl0ZXN0X2V2ZW50X3VuaG9vayh2bSk7
CisJdGVzdF9jbWRfdm1fY29udHJvbF9ldmVudHModm0pOwogCiAJdW5ob29rX2ludHJvc3BlY3Rp
b24odm0pOwogfQpkaWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMgYi92
aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwppbmRleCAzNzQ2ZmQyNDNiZDguLjdhMGRhYzJl
MmY4NCAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKKysrIGIvdmly
dC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKQEAgLTY4LDYgKzY4LDE2IEBAIGJvb2wga3ZtaV9p
c19rbm93bl9ldmVudCh1MTYgaWQpCiAJcmV0dXJuIGlkIDwgS1ZNSV9OVU1fRVZFTlRTICYmIHRl
c3RfYml0KGlkLCBLdm1pX2tub3duX2V2ZW50cyk7CiB9CiAKK2Jvb2wga3ZtaV9pc19rbm93bl92
bV9ldmVudCh1MTYgaWQpCit7CisJcmV0dXJuIGlkIDwgS1ZNSV9OVU1fRVZFTlRTICYmIHRlc3Rf
Yml0KGlkLCBLdm1pX2tub3duX3ZtX2V2ZW50cyk7Cit9CisKK3N0YXRpYyBib29sIGt2bWlfaXNf
dm1fZXZlbnRfZW5hYmxlZChzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksIHUxNiBpZCkK
K3sKKwlyZXR1cm4gaWQgPCBLVk1JX05VTV9FVkVOVFMgJiYgdGVzdF9iaXQoaWQsIGt2bWktPnZt
X2V2ZW50X2VuYWJsZV9tYXNrKTsKK30KKwogc3RhdGljIHZvaWQga3ZtaV9pbml0X2Fsd2F5c19h
bGxvd2VkX2NvbW1hbmRzKHZvaWQpCiB7CiAJYml0bWFwX3plcm8oS3ZtaV9hbHdheXNfYWxsb3dl
ZF9jb21tYW5kcywgS1ZNSV9OVU1fQ09NTUFORFMpOwpAQCAtMTEwLDYgKzEyMCw3IEBAIHN0YXRp
YyB2b2lkIGt2bWlfZnJlZShzdHJ1Y3Qga3ZtICprdm0pCiB7CiAJYml0bWFwX2ZyZWUoa3ZtLT5r
dm1pLT5jbWRfYWxsb3dfbWFzayk7CiAJYml0bWFwX2ZyZWUoa3ZtLT5rdm1pLT5ldmVudF9hbGxv
d19tYXNrKTsKKwliaXRtYXBfZnJlZShrdm0tPmt2bWktPnZtX2V2ZW50X2VuYWJsZV9tYXNrKTsK
IAogCWtmcmVlKGt2bS0+a3ZtaSk7CiAJa3ZtLT5rdm1pID0gTlVMTDsKQEAgLTEyNiw5ICsxMzcs
MTIgQEAga3ZtaV9hbGxvYyhzdHJ1Y3Qga3ZtICprdm0sIGNvbnN0IHN0cnVjdCBrdm1faW50cm9z
cGVjdGlvbl9ob29rICpob29rKQogCiAJa3ZtaS0+Y21kX2FsbG93X21hc2sgPSBiaXRtYXBfemFs
bG9jKEtWTUlfTlVNX0NPTU1BTkRTLCBHRlBfS0VSTkVMKTsKIAlrdm1pLT5ldmVudF9hbGxvd19t
YXNrID0gYml0bWFwX3phbGxvYyhLVk1JX05VTV9FVkVOVFMsIEdGUF9LRVJORUwpOwotCWlmICgh
a3ZtaS0+Y21kX2FsbG93X21hc2sgfHwgIWt2bWktPmV2ZW50X2FsbG93X21hc2spIHsKKwlrdm1p
LT52bV9ldmVudF9lbmFibGVfbWFzayA9IGJpdG1hcF96YWxsb2MoS1ZNSV9OVU1fRVZFTlRTLCBH
RlBfS0VSTkVMKTsKKwlpZiAoIWt2bWktPmNtZF9hbGxvd19tYXNrIHx8ICFrdm1pLT5ldmVudF9h
bGxvd19tYXNrIHx8CisJICAgICFrdm1pLT52bV9ldmVudF9lbmFibGVfbWFzaykgewogCQliaXRt
YXBfZnJlZShrdm1pLT5jbWRfYWxsb3dfbWFzayk7CiAJCWJpdG1hcF9mcmVlKGt2bWktPmV2ZW50
X2FsbG93X21hc2spOworCQliaXRtYXBfZnJlZShrdm1pLT52bV9ldmVudF9lbmFibGVfbWFzayk7
CiAJCWtmcmVlKGt2bWkpOwogCQlyZXR1cm4gTlVMTDsKIAl9CkBAIC0zOTksNiArNDEzLDkgQEAg
c3RhdGljIGJvb2wga3ZtaV91bmhvb2tfZXZlbnQoc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICpr
dm1pKQogewogCWludCBlcnI7CiAKKwlpZiAoIWt2bWlfaXNfdm1fZXZlbnRfZW5hYmxlZChrdm1p
LCBLVk1JX1ZNX0VWRU5UX1VOSE9PSykpCisJCXJldHVybiBmYWxzZTsKKwogCWVyciA9IGt2bWlf
bXNnX3NlbmRfdW5ob29rKGt2bWkpOwogCiAJcmV0dXJuICFlcnI7CkBAIC00MjQsMyArNDQxLDE0
IEBAIGludCBrdm1pX2lvY3RsX3ByZXVuaG9vayhzdHJ1Y3Qga3ZtICprdm0pCiAJbXV0ZXhfdW5s
b2NrKCZrdm0tPmt2bWlfbG9jayk7CiAJcmV0dXJuIGVycjsKIH0KKworaW50IGt2bWlfY21kX3Zt
X2NvbnRyb2xfZXZlbnRzKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwKKwkJCSAgICAg
ICB1MTYgZXZlbnRfaWQsIGJvb2wgZW5hYmxlKQoreworCWlmIChlbmFibGUpCisJCXNldF9iaXQo
ZXZlbnRfaWQsIGt2bWktPnZtX2V2ZW50X2VuYWJsZV9tYXNrKTsKKwllbHNlCisJCWNsZWFyX2Jp
dChldmVudF9pZCwga3ZtaS0+dm1fZXZlbnRfZW5hYmxlX21hc2spOworCisJcmV0dXJuIDA7Cit9
CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmggYi92aXJ0L2t2
bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKaW5kZXggNTdjMjJmMjBlNzRmLi45ODc1MTNkNmMx
YTcgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaAorKysgYi92
aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKQEAgLTI2LDYgKzI2LDkgQEAgdm9pZCBr
dm1pX21zZ19mcmVlKHZvaWQgKmFkZHIpOwogYm9vbCBrdm1pX2lzX2NvbW1hbmRfYWxsb3dlZChz
dHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksIHUxNiBpZCk7CiBib29sIGt2bWlfaXNfZXZl
bnRfYWxsb3dlZChzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksIHUxNiBpZCk7CiBib29s
IGt2bWlfaXNfa25vd25fZXZlbnQodTE2IGlkKTsKK2Jvb2wga3ZtaV9pc19rbm93bl92bV9ldmVu
dCh1MTYgaWQpOworaW50IGt2bWlfY21kX3ZtX2NvbnRyb2xfZXZlbnRzKHN0cnVjdCBrdm1faW50
cm9zcGVjdGlvbiAqa3ZtaSwKKwkJCSAgICAgICB1MTYgZXZlbnRfaWQsIGJvb2wgZW5hYmxlKTsK
IAogLyogYXJjaCAqLwogdm9pZCBrdm1pX2FyY2hfaW5pdF92Y3B1X2V2ZW50c19tYXNrKHVuc2ln
bmVkIGxvbmcgKnN1cHBvcnRlZCk7CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9u
L2t2bWlfbXNnLmMgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMKaW5kZXggNGFj
ZGI1OTUzMDFkLi5mZmQ3ZDk1YjY2NGYgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rp
b24va3ZtaV9tc2cuYworKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMKQEAg
LTE2MiwxNCArMTYyLDM1IEBAIHN0YXRpYyBpbnQgaGFuZGxlX3ZtX2dldF9pbmZvKHN0cnVjdCBr
dm1faW50cm9zcGVjdGlvbiAqa3ZtaSwKIAlyZXR1cm4ga3ZtaV9tc2dfdm1fcmVwbHkoa3ZtaSwg
bXNnLCAwLCAmcnBsLCBzaXplb2YocnBsKSk7CiB9CiAKK3N0YXRpYyBpbnQgaGFuZGxlX3ZtX2Nv
bnRyb2xfZXZlbnRzKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwKKwkJCQkgICAgY29u
c3Qgc3RydWN0IGt2bWlfbXNnX2hkciAqbXNnLAorCQkJCSAgICBjb25zdCB2b2lkICpfcmVxKQor
eworCWNvbnN0IHN0cnVjdCBrdm1pX3ZtX2NvbnRyb2xfZXZlbnRzICpyZXEgPSBfcmVxOworCWlu
dCBlYzsKKworCWlmIChyZXEtPnBhZGRpbmcxIHx8IHJlcS0+cGFkZGluZzIgfHwgcmVxLT5lbmFi
bGUgPiAxKQorCQllYyA9IC1LVk1fRUlOVkFMOworCWVsc2UgaWYgKCFrdm1pX2lzX2tub3duX3Zt
X2V2ZW50KHJlcS0+ZXZlbnRfaWQpKQorCQllYyA9IC1LVk1fRUlOVkFMOworCWVsc2UgaWYgKCFr
dm1pX2lzX2V2ZW50X2FsbG93ZWQoa3ZtaSwgcmVxLT5ldmVudF9pZCkpCisJCWVjID0gLUtWTV9F
UEVSTTsKKwllbHNlCisJCWVjID0ga3ZtaV9jbWRfdm1fY29udHJvbF9ldmVudHMoa3ZtaSwgcmVx
LT5ldmVudF9pZCwKKwkJCQkJCXJlcS0+ZW5hYmxlID09IDEpOworCisJcmV0dXJuIGt2bWlfbXNn
X3ZtX3JlcGx5KGt2bWksIG1zZywgZWMsIE5VTEwsIDApOworfQorCiAvKgogICogVGhlc2UgY29t
bWFuZHMgYXJlIGV4ZWN1dGVkIGJ5IHRoZSByZWNlaXZpbmcgdGhyZWFkLgogICovCiBzdGF0aWMg
a3ZtaV92bV9tc2dfZmN0IGNvbnN0IG1zZ192bVtdID0gewotCVtLVk1JX0dFVF9WRVJTSU9OXSAg
ICAgID0gaGFuZGxlX2dldF92ZXJzaW9uLAotCVtLVk1JX1ZNX0NIRUNLX0NPTU1BTkRdID0gaGFu
ZGxlX3ZtX2NoZWNrX2NvbW1hbmQsCi0JW0tWTUlfVk1fQ0hFQ0tfRVZFTlRdICAgPSBoYW5kbGVf
dm1fY2hlY2tfZXZlbnQsCi0JW0tWTUlfVk1fR0VUX0lORk9dICAgICAgPSBoYW5kbGVfdm1fZ2V0
X2luZm8sCisJW0tWTUlfR0VUX1ZFUlNJT05dICAgICAgID0gaGFuZGxlX2dldF92ZXJzaW9uLAor
CVtLVk1JX1ZNX0NIRUNLX0NPTU1BTkRdICA9IGhhbmRsZV92bV9jaGVja19jb21tYW5kLAorCVtL
Vk1JX1ZNX0NIRUNLX0VWRU5UXSAgICA9IGhhbmRsZV92bV9jaGVja19ldmVudCwKKwlbS1ZNSV9W
TV9DT05UUk9MX0VWRU5UU10gPSBoYW5kbGVfdm1fY29udHJvbF9ldmVudHMsCisJW0tWTUlfVk1f
R0VUX0lORk9dICAgICAgID0gaGFuZGxlX3ZtX2dldF9pbmZvLAogfTsKIAogc3RhdGljIGt2bWlf
dm1fbXNnX2ZjdCBnZXRfdm1fbXNnX2hhbmRsZXIodTE2IGlkKQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
