Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E62DA87F7A
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 18:17:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2659CE76;
	Fri,  9 Aug 2019 16:15:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D6AECE47
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:15:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id 705CC1DD99
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:15:00 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	C3F22305D34E; Fri,  9 Aug 2019 19:01:22 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 5A9F4305B7A1;
	Fri,  9 Aug 2019 19:01:21 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 53/92] kvm: introspection: add KVMI_INJECT_EXCEPTION +
	KVMI_EVENT_TRAP
Date: Fri,  9 Aug 2019 19:00:08 +0300
Message-Id: <20190809160047.8319-54-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp2.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?q?Samuel=20Laur=C3=A9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org,
	=?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	=?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Zhang@mail.linuxfoundation.org,
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
	Joerg Roedel <joro@8bytes.org>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhlIEtWTUlfSU5K
RUNUX0VYQ0VQVElPTiBjb21tYW5kIGlzIHVzZWQgYnkgdGhlIGludHJvc3BlY3Rpb24gdG9vbCB0
bwppbmplY3QgZXhjZXB0aW9ucyAoZWcuIGdldCBhIHBhZ2UgZnJvbSBzd2FwKS4gVGhlIGV4Y2Vw
dGlvbiBpcyBxdWV1ZWQKcmlnaHQgYmVmb3JlIGVudGVyaW5nIHRoZSBndWVzdC4gSWYgdGhlcmUg
aXMgYWxyZWFkeSBhbiBldmVudCBwZW5kaW5nCihleGNlcHRpb24sIGludGVycnVwdCBvciBOTUkp
IHdlIG5vdGlmeSB0aGUgaW50cm9zcGVjdGlvbiB0b29sIHdpdGggdGhlCktWTUlfRVZFTlRfVFJB
UCBldmVudCBhbmQgYWJvcnQgdGhlIGluamVjdGlvbi4gVGhlIGludHJvc3BlY2lvbiB0b29sIGlz
CmV4cGVjdGVkIHRvIHRyeSBhZ2FpbiBhdCBhIGxhdGVyIHRpbWUuCgpDQzogSm9lcmcgUm9lZGVs
IDxqb3JvQDhieXRlcy5vcmc+ClNpZ25lZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJp
dGRlZmVuZGVyLmNvbT4KQ28tZGV2ZWxvcGVkLWJ5OiBOaWN1yJlvciBDw67Im3UgPG5jaXR1QGJp
dGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRk
ZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRl
ZmVuZGVyLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL3ZpcnR1YWwva3ZtL2t2bWkucnN0IHwgIDcx
ICsrKysrKysrKysrKysrKysrKysKIGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oICAg
fCAgIDggKysrCiBhcmNoL3g4Ni9rdm0va3ZtaS5jICAgICAgICAgICAgICAgIHwgMTA4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3g4Ni9rdm0veDg2LmMgICAgICAgICAgICAg
ICAgIHwgIDExICsrKwogaW5jbHVkZS9saW51eC9rdm1pLmggICAgICAgICAgICAgICB8ICAgNCAr
KwogaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCAgICAgICAgICB8ICAgOCArKysKIHZpcnQva3Zt
L2t2bWkuYyAgICAgICAgICAgICAgICAgICAgfCAgNDAgKysrKysrKysrKysKIHZpcnQva3ZtL2t2
bWlfaW50LmggICAgICAgICAgICAgICAgfCAgMTYgKysrKysKIHZpcnQva3ZtL2t2bWlfbXNnLmMg
ICAgICAgICAgICAgICAgfCAgMjEgKysrKysrCiA5IGZpbGVzIGNoYW5nZWQsIDI4NyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0dWFsL2t2bS9rdm1pLnJzdCBi
L0RvY3VtZW50YXRpb24vdmlydHVhbC9rdm0va3ZtaS5yc3QKaW5kZXggOWUxNTEzMmVkOTc2Li4x
ZWFlZDdjNjExNDggMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydHVhbC9rdm0va3ZtaS5y
c3QKKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0dWFsL2t2bS9rdm1pLnJzdApAQCAtOTY5LDYgKzk2
OSw0NCBAQCBSZXR1cm5zIGEgQ1BVSUQgbGVhZiAoYXMgc2VlbiBieSB0aGUgZ3Vlc3QgT1MpLgog
KiAtS1ZNX0VBR0FJTiAtIHRoZSBzZWxlY3RlZCB2Q1BVIGNhbid0IGJlIGludHJvc3BlY3RlZCB5
ZXQKICogLUtWTV9FTk9FTlQgLSB0aGUgc2VsZWN0ZWQgbGVhZiBpcyBub3QgcHJlc2VudCBvciBp
cyBpbnZhbGlkCiAKKzIwLiBLVk1JX0lOSkVDVF9FWENFUFRJT04KKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KKworOkFyY2hpdGVjdHVyZXM6IHg4NgorOlZlcnNpb25zOiA+PSAxCis6UGFyYW1l
dGVyczoKKworOjoKKworCXN0cnVjdCBrdm1pX3ZjcHVfaGRyOworCXN0cnVjdCBrdm1pX2luamVj
dF9leGNlcHRpb24geworCQlfX3U4IG5yOworCQlfX3U4IGhhc19lcnJvcjsKKwkJX191MTYgcGFk
ZGluZzsKKwkJX191MzIgZXJyb3JfY29kZTsKKwkJX191NjQgYWRkcmVzczsKKwl9OworCis6UmV0
dXJuczoKKworOjoKKworCXN0cnVjdCBrdm1pX2Vycm9yX2NvZGUKKworSW5qZWN0cyBhIHZDUFUg
ZXhjZXB0aW9uIHdpdGggb3Igd2l0aG91dCBhbiBlcnJvciBjb2RlLiBJbiBjYXNlIG9mIHBhZ2Ug
ZmF1bHQKK2V4Y2VwdGlvbiwgdGhlIGd1ZXN0IHZpcnR1YWwgYWRkcmVzcyBoYXMgdG8gYmUgc3Bl
Y2lmaWVkLgorCitUaGUgaW50cm9zcGVjdGlvbiB0b29sIHNob3VsZCBlbmFibGUgdGhlICpLVk1J
X0VWRU5UX1RSQVAqIGV2ZW50IGluCitvcmRlciB0byBiZSBub3RpZmllZCBpZiB0aGUgZXhwZWN0
aW9uIHdhcyBub3QgZGVsaXZlcmVkLgorCis6RXJyb3JzOgorCisqIC1LVk1fRUlOVkFMIC0gdGhl
IHNlbGVjdGVkIHZDUFUgaXMgaW52YWxpZAorKiAtS1ZNX0VJTlZBTCAtIHRoZSBzcGVjaWZpZWQg
ZXhjZXB0aW9uIG51bWJlciBpcyBpbnZhbGlkCisqIC1LVk1fRUlOVkFMIC0gdGhlIHNwZWNpZmll
ZCBhZGRyZXNzIGlzIGludmFsaWQKKyogLUtWTV9FSU5WQUwgLSBwYWRkaW5nIGlzIG5vdCB6ZXJv
CisqIC1LVk1fRUFHQUlOIC0gdGhlIHNlbGVjdGVkIHZDUFUgY2FuJ3QgYmUgaW50cm9zcGVjdGVk
IHlldAorCiBFdmVudHMKID09PT09PQogCkBAIC0xMTY3LDMgKzEyMDUsMzYgQEAgY2Fubm90IGJl
IGRpc2FibGVkIHZpYSAqS1ZNSV9DT05UUk9MX0VWRU5UUyouCiBUaGlzIGV2ZW50IGhhcyBhIGxv
dyBwcmlvcml0eS4gSXQgd2lsbCBiZSBzZW50IGFmdGVyIGFueSBvdGhlciB2Q1BVCiBpbnRyb3Nw
ZWN0aW9uIGV2ZW50IGFuZCB3aGVuIG5vIHZDUFUgaW50cm9zcGVjdGlvbiBjb21tYW5kIGlzIHF1
ZXVlZC4KIAorNS4gS1ZNSV9FVkVOVF9UUkFQCistLS0tLS0tLS0tLS0tLS0tLS0KKworOkFyY2hp
dGVjdHVyZXM6IHg4NgorOlZlcnNpb25zOiA+PSAxCis6QWN0aW9uczogQ09OVElOVUUsIENSQVNI
Cis6UGFyYW1ldGVyczoKKworOjoKKworCXN0cnVjdCBrdm1pX2V2ZW50OworCXN0cnVjdCBrdm1p
X2V2ZW50X3RyYXAgeworCQlfX3UzMiB2ZWN0b3I7CisJCV9fdTMyIHR5cGU7CisJCV9fdTMyIGVy
cm9yX2NvZGU7CisJCV9fdTMyIHBhZGRpbmc7CisJCV9fdTY0IGNyMjsKKwl9OworCis6UmV0dXJu
czoKKworOjoKKworCXN0cnVjdCBrdm1pX3ZjcHVfaGRyOworCXN0cnVjdCBrdm1pX2V2ZW50X3Jl
cGx5OworCitUaGlzIGV2ZW50IGlzIHNlbnQgaWYgYSBwcmV2aW91cyAqS1ZNSV9JTkpFQ1RfRVhD
RVBUSU9OKiBjb21tYW5kIGhhcworYmVlbiBvdmVyd3JpdHRlbiBieSBhbiBpbnRlcnJ1cHQgcGlj
a2VkIHVwIGR1cmluZyBndWVzdCByZWVudHJ5IGFuZCB0aGUKK2ludHJvc3BlY3Rpb24gaGFzIGJl
ZW4gZW5hYmxlZCBmb3IgdGhpcyBldmVudCAoc2VlICpLVk1JX0NPTlRST0xfRVZFTlRTKikuCisK
K2Bga3ZtaV9ldmVudGBgLCBleGNlcHRpb24vaW50ZXJydXB0IG51bWJlciAodmVjdG9yKSwgZXhj
ZXB0aW9uL2ludGVycnVwdAordHlwZSwgZXhjZXB0aW9uIGNvZGUgKGBgZXJyb3JfY29kZWBgKSBh
bmQgQ1IyIGFyZSBzZW50IHRvIHRoZSBpbnRyb3NwZWN0b3IuCisKZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oIGIvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9r
dm1pLmgKaW5kZXggZmEyNzE5MjI2MTk4Li5iMDc0YWQ3MzVlODQgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9h
c20va3ZtaS5oCkBAIC0yNiw2ICsyNiwxNCBAQCBzdHJ1Y3Qga3ZtaV9ldmVudF9hcmNoIHsKIAl9
IG1zcnM7CiB9OwogCitzdHJ1Y3Qga3ZtaV9ldmVudF90cmFwIHsKKwlfX3UzMiB2ZWN0b3I7CisJ
X191MzIgdHlwZTsKKwlfX3UzMiBlcnJvcl9jb2RlOworCV9fdTMyIHBhZGRpbmc7CisJX191NjQg
Y3IyOworfTsKKwogc3RydWN0IGt2bWlfZ2V0X3JlZ2lzdGVycyB7CiAJX191MTYgbm1zcnM7CiAJ
X191MTYgcGFkZGluZzE7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0va3ZtaS5jIGIvYXJjaC94
ODYva3ZtL2t2bWkuYwppbmRleCA0NjE1YmJlOWMwZGIuLjhjMTgwMzBkMTJmNCAxMDA2NDQKLS0t
IGEvYXJjaC94ODYva3ZtL2t2bWkuYworKysgYi9hcmNoL3g4Ni9rdm0va3ZtaS5jCkBAIC02LDYg
KzYsNyBAQAogICovCiAjaW5jbHVkZSAieDg2LmgiCiAjaW5jbHVkZSAiY3B1aWQuaCIKKyNpbmNs
dWRlIDxhc20vdm14Lmg+CiAjaW5jbHVkZSAiLi4vLi4vLi4vdmlydC9rdm0va3ZtaV9pbnQuaCIK
IAogc3RhdGljIHZvaWQgKmFsbG9jX2dldF9yZWdpc3RlcnNfcmVwbHkoY29uc3Qgc3RydWN0IGt2
bWlfbXNnX2hkciAqbXNnLApAQCAtMjEyLDYgKzIxMyw4NyBAQCBib29sIGt2bWlfYXJjaF9wZl9l
dmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGdwYSwgZ3ZhX3QgZ3ZhLAogCXJldHVy
biByZXQ7CiB9CiAKK2Jvb2wga3ZtaV9hcmNoX3F1ZXVlX2V4Y2VwdGlvbihzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpCit7CisJaWYgKCF2Y3B1LT5hcmNoLmV4Y2VwdGlvbi5pbmplY3RlZCAmJgorCSAg
ICAhdmNwdS0+YXJjaC5pbnRlcnJ1cHQuaW5qZWN0ZWQgJiYKKwkgICAgIXZjcHUtPmFyY2gubm1p
X2luamVjdGVkKSB7CisJCXN0cnVjdCBrdm1pX3ZjcHUgKml2Y3B1ID0gSVZDUFUodmNwdSk7CisJ
CXN0cnVjdCB4ODZfZXhjZXB0aW9uIGUgPSB7CisJCQkudmVjdG9yID0gaXZjcHUtPmV4Y2VwdGlv
bi5uciwKKwkJCS5lcnJvcl9jb2RlX3ZhbGlkID0gaXZjcHUtPmV4Y2VwdGlvbi5lcnJvcl9jb2Rl
X3ZhbGlkLAorCQkJLmVycm9yX2NvZGUgPSBpdmNwdS0+ZXhjZXB0aW9uLmVycm9yX2NvZGUsCisJ
CQkuYWRkcmVzcyA9IGl2Y3B1LT5leGNlcHRpb24uYWRkcmVzcywKKwkJfTsKKworCQlpZiAoZS52
ZWN0b3IgPT0gUEZfVkVDVE9SKQorCQkJa3ZtX2luamVjdF9wYWdlX2ZhdWx0KHZjcHUsICZlKTsK
KwkJZWxzZSBpZiAoZS5lcnJvcl9jb2RlX3ZhbGlkKQorCQkJa3ZtX3F1ZXVlX2V4Y2VwdGlvbl9l
KHZjcHUsIGUudmVjdG9yLCBlLmVycm9yX2NvZGUpOworCQllbHNlCisJCQlrdm1fcXVldWVfZXhj
ZXB0aW9uKHZjcHUsIGUudmVjdG9yKTsKKworCQlyZXR1cm4gdHJ1ZTsKKwl9CisKKwlyZXR1cm4g
ZmFsc2U7Cit9CisKK3N0YXRpYyB1MzIga3ZtaV9zZW5kX3RyYXAoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCB1MzIgdmVjdG9yLCB1MzIgdHlwZSwKKwkJCSAgdTMyIGVycm9yX2NvZGUsIHU2NCBjcjIp
Cit7CisJc3RydWN0IGt2bWlfZXZlbnRfdHJhcCBlID0geworCQkuZXJyb3JfY29kZSA9IGVycm9y
X2NvZGUsCisJCS52ZWN0b3IgPSB2ZWN0b3IsCisJCS50eXBlID0gdHlwZSwKKwkJLmNyMiA9IGNy
MgorCX07CisJaW50IGVyciwgYWN0aW9uOworCisJZXJyID0ga3ZtaV9zZW5kX2V2ZW50KHZjcHUs
IEtWTUlfRVZFTlRfVFJBUCwgJmUsIHNpemVvZihlKSwKKwkJCSAgICAgIE5VTEwsIDAsICZhY3Rp
b24pOworCWlmIChlcnIpCisJCXJldHVybiBLVk1JX0VWRU5UX0FDVElPTl9DT05USU5VRTsKKwor
CXJldHVybiBhY3Rpb247Cit9CisKK3ZvaWQga3ZtaV9hcmNoX3RyYXBfZXZlbnQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KQoreworCXUzMiB2ZWN0b3IsIHR5cGUsIGVycjsKKwl1MzIgYWN0aW9uOwor
CisJaWYgKHZjcHUtPmFyY2guZXhjZXB0aW9uLmluamVjdGVkKSB7CisJCXZlY3RvciA9IHZjcHUt
PmFyY2guZXhjZXB0aW9uLm5yOworCQllcnIgPSB2Y3B1LT5hcmNoLmV4Y2VwdGlvbi5lcnJvcl9j
b2RlOworCisJCWlmIChrdm1fZXhjZXB0aW9uX2lzX3NvZnQodmVjdG9yKSkKKwkJCXR5cGUgPSBJ
TlRSX1RZUEVfU09GVF9FWENFUFRJT047CisJCWVsc2UKKwkJCXR5cGUgPSBJTlRSX1RZUEVfSEFS
RF9FWENFUFRJT047CisJfSBlbHNlIGlmICh2Y3B1LT5hcmNoLmludGVycnVwdC5pbmplY3RlZCkg
eworCQl2ZWN0b3IgPSB2Y3B1LT5hcmNoLmludGVycnVwdC5ucjsKKwkJZXJyID0gMDsKKworCQlp
ZiAodmNwdS0+YXJjaC5pbnRlcnJ1cHQuc29mdCkKKwkJCXR5cGUgPSBJTlRSX1RZUEVfU09GVF9J
TlRSOworCQllbHNlCisJCQl0eXBlID0gSU5UUl9UWVBFX0VYVF9JTlRSOworCX0gZWxzZSB7CisJ
CXZlY3RvciA9IDA7CisJCXR5cGUgPSAwOworCQllcnIgPSAwOworCX0KKworCWFjdGlvbiA9IGt2
bWlfc2VuZF90cmFwKHZjcHUsIHZlY3RvciwgdHlwZSwgZXJyLCB2Y3B1LT5hcmNoLmNyMik7CisJ
c3dpdGNoIChhY3Rpb24pIHsKKwljYXNlIEtWTUlfRVZFTlRfQUNUSU9OX0NPTlRJTlVFOgorCQli
cmVhazsKKwlkZWZhdWx0OgorCQlrdm1pX2hhbmRsZV9jb21tb25fZXZlbnRfYWN0aW9ucyh2Y3B1
LCBhY3Rpb24sICJUUkFQIik7CisJfQorfQorCiBpbnQga3ZtaV9hcmNoX2NtZF9nZXRfY3B1aWQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJICAgIGNvbnN0IHN0cnVjdCBrdm1pX2dldF9jcHVp
ZCAqcmVxLAogCQkJICAgIHN0cnVjdCBrdm1pX2dldF9jcHVpZF9yZXBseSAqcnBsKQpAQCAtMjQx
LDYgKzMyMywzMiBAQCBpbnQga3ZtaV9hcmNoX2NtZF9nZXRfdmNwdV9pbmZvKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGJvb2wgaXNfdmVjdG9yX3ZhbGlk
KHU4IHZlY3RvcikKK3sKKwlyZXR1cm4gdHJ1ZTsKK30KKworc3RhdGljIGJvb2wgaXNfZ3ZhX3Zh
bGlkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTY0IGd2YSkKK3sKKwlyZXR1cm4gdHJ1ZTsKK30K
KworaW50IGt2bWlfYXJjaF9jbWRfaW5qZWN0X2V4Y2VwdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHU4IHZlY3RvciwKKwkJCQkgICBib29sIGVycm9yX2NvZGVfdmFsaWQsCisJCQkJICAgdTMy
IGVycm9yX2NvZGUsIHU2NCBhZGRyZXNzKQoreworCWlmICghKGlzX3ZlY3Rvcl92YWxpZCh2ZWN0
b3IpICYmIGlzX2d2YV92YWxpZCh2Y3B1LCBhZGRyZXNzKSkpCisJCXJldHVybiAtS1ZNX0VJTlZB
TDsKKworCUlWQ1BVKHZjcHUpLT5leGNlcHRpb24ucGVuZGluZyA9IHRydWU7CisJSVZDUFUodmNw
dSktPmV4Y2VwdGlvbi5uciA9IHZlY3RvcjsKKwlJVkNQVSh2Y3B1KS0+ZXhjZXB0aW9uLmVycm9y
X2NvZGUgPSBlcnJvcl9jb2RlX3ZhbGlkID8gZXJyb3JfY29kZSA6IDA7CisJSVZDUFUodmNwdSkt
PmV4Y2VwdGlvbi5lcnJvcl9jb2RlX3ZhbGlkID0gZXJyb3JfY29kZV92YWxpZDsKKwlJVkNQVSh2
Y3B1KS0+ZXhjZXB0aW9uLmFkZHJlc3MgPSBhZGRyZXNzOworCisJcmV0dXJuIDA7Cit9CisKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgewogCXVuc2lnbmVkIGludCBhbGxvd19iaXQ7CiAJZW51bSBrdm1f
cGFnZV90cmFja19tb2RlIHRyYWNrX21vZGU7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2
LmMgYi9hcmNoL3g4Ni9rdm0veDg2LmMKaW5kZXggNjJkMTViYmIyMzMyLi5lMzhjMGI5NWEwZTcg
MTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS94ODYuYworKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMK
QEAgLTc5MzAsNiArNzkzMCwxNyBAQCBzdGF0aWMgaW50IHZjcHVfZW50ZXJfZ3Vlc3Qoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KQogCQl9CiAJfQogCisJaWYgKCFrdm1pX3F1ZXVlX2V4Y2VwdGlvbih2
Y3B1KSkKKwkJa3ZtaV90cmFwX2V2ZW50KHZjcHUpOworCWVsc2UgaWYgKHZjcHUtPmFyY2guZXhj
ZXB0aW9uLnBlbmRpbmcpIHsKKwkJa3ZtX3g4Nl9vcHMtPnF1ZXVlX2V4Y2VwdGlvbih2Y3B1KTsK
KwkJaWYgKGV4Y2VwdGlvbl90eXBlKHZjcHUtPmFyY2guZXhjZXB0aW9uLm5yKSA9PSBFWENQVF9G
QVVMVCkKKwkJCV9fa3ZtX3NldF9yZmxhZ3ModmNwdSwga3ZtX2dldF9yZmxhZ3ModmNwdSkgfAor
CQkJCQkJWDg2X0VGTEFHU19SRik7CisJCXZjcHUtPmFyY2guZXhjZXB0aW9uLnBlbmRpbmcgPSBm
YWxzZTsKKwkJdmNwdS0+YXJjaC5leGNlcHRpb24uaW5qZWN0ZWQgPSB0cnVlOworCX0KKwogCXIg
PSBrdm1fbW11X3JlbG9hZCh2Y3B1KTsKIAlpZiAodW5saWtlbHkocikpIHsKIAkJZ290byBjYW5j
ZWxfaW5qZWN0aW9uOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1pLmggYi9pbmNsdWRl
L2xpbnV4L2t2bWkuaAppbmRleCA4MGMxNWI5MTk1ZTQuLjVhZTAyYzY0ZmIzMyAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9saW51eC9rdm1pLmgKKysrIGIvaW5jbHVkZS9saW51eC9rdm1pLmgKQEAgLTE2
LDYgKzE2LDggQEAgaW50IGt2bWlfaW9jdGxfZXZlbnQoc3RydWN0IGt2bSAqa3ZtLCB2b2lkIF9f
dXNlciAqYXJncCk7CiBpbnQga3ZtaV9pb2N0bF91bmhvb2soc3RydWN0IGt2bSAqa3ZtLCBib29s
IGZvcmNlX3Jlc2V0KTsKIGludCBrdm1pX3ZjcHVfaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Owogdm9pZCBrdm1pX3ZjcHVfdW5pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Citib29sIGt2
bWlfcXVldWVfZXhjZXB0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cit2b2lkIGt2bWlfdHJh
cF9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1pX2hhbmRsZV9yZXF1ZXN0
cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1pX2luaXRfZW11bGF0ZShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1pX2FjdGl2YXRlX3JlcF9jb21wbGV0ZShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpOwpAQCAtMjksNiArMzEsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQga3Zt
aV9kZXN0cm95X3ZtKHN0cnVjdCBrdm0gKmt2bSkgeyB9CiBzdGF0aWMgaW5saW5lIGludCBrdm1p
X3ZjcHVfaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpIHsgcmV0dXJuIDA7IH0KIHN0YXRpYyBp
bmxpbmUgdm9pZCBrdm1pX3ZjcHVfdW5pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkgeyB9CiBz
dGF0aWMgaW5saW5lIHZvaWQga3ZtaV9oYW5kbGVfcmVxdWVzdHMoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KSB7IH0KK3N0YXRpYyBpbmxpbmUgYm9vbCBrdm1pX3F1ZXVlX2V4Y2VwdGlvbihzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpIHsgcmV0dXJuIHRydWU7IH0KK3N0YXRpYyBpbmxpbmUgdm9pZCBrdm1p
X3RyYXBfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KSB7IH0KIHN0YXRpYyBpbmxpbmUgdm9p
ZCBrdm1pX2luaXRfZW11bGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpIHsgfQogc3RhdGljIGlu
bGluZSB2b2lkIGt2bWlfYWN0aXZhdGVfcmVwX2NvbXBsZXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSkgeyB9CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmggYi9pbmNsdWRl
L3VhcGkvbGludXgva3ZtaS5oCmluZGV4IGNhOWM2YjZhZWVkNS4uYTQ1ODNkZTVjMmY2IDEwMDY0
NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51
eC9rdm1pLmgKQEAgLTIxNSw2ICsyMTUsMTQgQEAgc3RydWN0IGt2bWlfdmNwdV9oZHIgewogCV9f
dTMyIHBhZGRpbmcyOwogfTsKIAorc3RydWN0IGt2bWlfaW5qZWN0X2V4Y2VwdGlvbiB7CisJX191
OCBucjsKKwlfX3U4IGhhc19lcnJvcjsKKwlfX3UxNiBwYWRkaW5nOworCV9fdTMyIGVycm9yX2Nv
ZGU7CisJX191NjQgYWRkcmVzczsKK307CisKIHN0cnVjdCBrdm1pX2V2ZW50IHsKIAlfX3UxNiBz
aXplOwogCV9fdTE2IHZjcHU7CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1pLmMgYi92aXJ0L2t2
bS9rdm1pLmMKaW5kZXggYTIwODkxZDNhMmNlLi5lM2YzMDg4OThhNjAgMTAwNjQ0Ci0tLSBhL3Zp
cnQva3ZtL2t2bWkuYworKysgYi92aXJ0L2t2bS9rdm1pLmMKQEAgLTEwNTgsNiArMTA1OCw0NiBA
QCB2b2lkIGt2bWlfYWN0aXZhdGVfcmVwX2NvbXBsZXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
IH0KIEVYUE9SVF9TWU1CT0woa3ZtaV9hY3RpdmF0ZV9yZXBfY29tcGxldGUpOwogCisvKgorICog
VGhpcyBmdW5jdGlvbiByZXR1cm5zIGZhbHNlIGlmIHRoZXJlIGlzIGFuIGV4Y2VwdGlvbiBvciBp
bnRlcnJ1cHQgcGVuZGluZy4KKyAqIEl0IHJldHVybnMgdHJ1ZSBpbiBhbGwgb3RoZXIgY2FzZXMg
aW5jbHVkaW5nIEtWTUkgbm90IGJlaW5nIGluaXRpYWxpemVkLgorICovCitib29sIGt2bWlfcXVl
dWVfZXhjZXB0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlzdHJ1Y3Qga3ZtaSAqaWt2
bTsKKwlib29sIHJldCA9IHRydWU7CisKKwlpa3ZtID0ga3ZtaV9nZXQodmNwdS0+a3ZtKTsKKwlp
ZiAoIWlrdm0pCisJCXJldHVybiB0cnVlOworCisJaWYgKCFJVkNQVSh2Y3B1KS0+ZXhjZXB0aW9u
LnBlbmRpbmcpCisJCWdvdG8gb3V0OworCisJcmV0ID0ga3ZtaV9hcmNoX3F1ZXVlX2V4Y2VwdGlv
bih2Y3B1KTsKKworCW1lbXNldCgmSVZDUFUodmNwdSktPmV4Y2VwdGlvbiwgMCwgc2l6ZW9mKElW
Q1BVKHZjcHUpLT5leGNlcHRpb24pKTsKKworb3V0OgorCWt2bWlfcHV0KHZjcHUtPmt2bSk7CisK
KwlyZXR1cm4gcmV0OworfQorCit2b2lkIGt2bWlfdHJhcF9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCit7CisJc3RydWN0IGt2bWkgKmlrdm07CisKKwlpa3ZtID0ga3ZtaV9nZXQodmNwdS0+
a3ZtKTsKKwlpZiAoIWlrdm0pCisJCXJldHVybjsKKworCWlmIChpc19ldmVudF9lbmFibGVkKHZj
cHUsIEtWTUlfRVZFTlRfVFJBUCkpCisJCWt2bWlfYXJjaF90cmFwX2V2ZW50KHZjcHUpOworCisJ
a3ZtaV9wdXQodmNwdS0+a3ZtKTsKK30KKwogc3RhdGljIGJvb2wgX19rdm1pX2NyZWF0ZV92Y3B1
X2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIHsKIAl1MzIgYWN0aW9uOwpkaWZmIC0tZ2l0
IGEvdmlydC9rdm0va3ZtaV9pbnQuaCBiL3ZpcnQva3ZtL2t2bWlfaW50LmgKaW5kZXggMjI1MDhk
MTQ3NDk1Li4yZWFkZWI2ZWZkZTggMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2bWlfaW50LmgKKysr
IGIvdmlydC9rdm0va3ZtaV9pbnQuaApAQCAtMTA1LDYgKzEwNSwxNCBAQCBzdHJ1Y3Qga3ZtaV92
Y3B1IHsKIAlib29sIHJlcGx5X3dhaXRpbmc7CiAJc3RydWN0IGt2bWlfdmNwdV9yZXBseSByZXBs
eTsKIAorCXN0cnVjdCB7CisJCXU4IG5yOworCQl1MzIgZXJyb3JfY29kZTsKKwkJYm9vbCBlcnJv
cl9jb2RlX3ZhbGlkOworCQl1NjQgYWRkcmVzczsKKwkJYm9vbCBwZW5kaW5nOworCX0gZXhjZXB0
aW9uOworCiAJYm9vbCBoYXZlX2RlbGF5ZWRfcmVnczsKIAlzdHJ1Y3Qga3ZtX3JlZ3MgZGVsYXll
ZF9yZWdzOwogCkBAIC0xNjUsNiArMTczLDkgQEAgYm9vbCBrdm1pX3NvY2tfZ2V0KHN0cnVjdCBr
dm1pICppa3ZtLCBpbnQgZmQpOwogdm9pZCBrdm1pX3NvY2tfc2h1dGRvd24oc3RydWN0IGt2bWkg
Kmlrdm0pOwogdm9pZCBrdm1pX3NvY2tfcHV0KHN0cnVjdCBrdm1pICppa3ZtKTsKIGJvb2wga3Zt
aV9tc2dfcHJvY2VzcyhzdHJ1Y3Qga3ZtaSAqaWt2bSk7CitpbnQga3ZtaV9zZW5kX2V2ZW50KHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTMyIGV2X2lkLAorCQkgICAgdm9pZCAqZXYsIHNpemVfdCBl
dl9zaXplLAorCQkgICAgdm9pZCAqcnBsLCBzaXplX3QgcnBsX3NpemUsIGludCAqYWN0aW9uKTsK
IHUzMiBrdm1pX21zZ19zZW5kX3BmKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTY0IGdwYSwgdTY0
IGd2YSwgdTggYWNjZXNzLAogCQkgICAgIGJvb2wgKnNpbmdsZXN0ZXAsIGJvb2wgKnJlcF9jb21w
bGV0ZSwKIAkJICAgICB1NjQgKmN0eF9hZGRyLCB1OCAqY3R4LCB1MzIgKmN0eF9zaXplKTsKQEAg
LTIzMCwxMCArMjQxLDE1IEBAIGludCBrdm1pX2FyY2hfY21kX3NldF9wYWdlX3dyaXRlX2JpdG1h
cChzdHJ1Y3Qga3ZtaSAqaWt2bSwKIHZvaWQga3ZtaV9hcmNoX3NldHVwX2V2ZW50KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bWlfZXZlbnQgKmV2KTsKIGJvb2wga3ZtaV9hcmNoX3Bm
X2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBndmFfdCBndmEsCiAJCQl1
OCBhY2Nlc3MpOworYm9vbCBrdm1pX2FyY2hfcXVldWVfZXhjZXB0aW9uKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSk7Cit2b2lkIGt2bWlfYXJjaF90cmFwX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSk7CiBpbnQga3ZtaV9hcmNoX2NtZF9nZXRfY3B1aWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAog
CQkJICAgIGNvbnN0IHN0cnVjdCBrdm1pX2dldF9jcHVpZCAqcmVxLAogCQkJICAgIHN0cnVjdCBr
dm1pX2dldF9jcHVpZF9yZXBseSAqcnBsKTsKIGludCBrdm1pX2FyY2hfY21kX2dldF92Y3B1X2lu
Zm8oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJCXN0cnVjdCBrdm1pX2dldF92Y3B1X2luZm9f
cmVwbHkgKnJwbCk7CitpbnQga3ZtaV9hcmNoX2NtZF9pbmplY3RfZXhjZXB0aW9uKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgdTggdmVjdG9yLAorCQkJCSAgIGJvb2wgZXJyb3JfY29kZV92YWxpZCwg
dTMyIGVycm9yX2NvZGUsCisJCQkJICAgdTY0IGFkZHJlc3MpOwogCiAjZW5kaWYKZGlmZiAtLWdp
dCBhL3ZpcnQva3ZtL2t2bWlfbXNnLmMgYi92aXJ0L2t2bS9rdm1pX21zZy5jCmluZGV4IDk1NDgw
NDJkZTYxOC4uZTgwZDI4ZGJiMDYxIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1pX21zZy5jCisr
KyBiL3ZpcnQva3ZtL2t2bWlfbXNnLmMKQEAgLTM2LDYgKzM2LDcgQEAgc3RhdGljIGNvbnN0IGNo
YXIgKmNvbnN0IG1zZ19JRHNbXSA9IHsKIAlbS1ZNSV9HRVRfUkVHSVNURVJTXSAgICAgICAgID0g
IktWTUlfR0VUX1JFR0lTVEVSUyIsCiAJW0tWTUlfR0VUX1ZDUFVfSU5GT10gICAgICAgICA9ICJL
Vk1JX0dFVF9WQ1BVX0lORk8iLAogCVtLVk1JX0dFVF9WRVJTSU9OXSAgICAgICAgICAgPSAiS1ZN
SV9HRVRfVkVSU0lPTiIsCisJW0tWTUlfSU5KRUNUX0VYQ0VQVElPTl0gICAgICA9ICJLVk1JX0lO
SkVDVF9FWENFUFRJT04iLAogCVtLVk1JX1BBVVNFX1ZDUFVdICAgICAgICAgICAgPSAiS1ZNSV9Q
QVVTRV9WQ1BVIiwKIAlbS1ZNSV9SRUFEX1BIWVNJQ0FMXSAgICAgICAgID0gIktWTUlfUkVBRF9Q
SFlTSUNBTCIsCiAJW0tWTUlfU0VUX1BBR0VfQUNDRVNTXSAgICAgICA9ICJLVk1JX1NFVF9QQUdF
X0FDQ0VTUyIsCkBAIC02MjAsNiArNjIxLDI1IEBAIHN0YXRpYyBpbnQgaGFuZGxlX3NldF9yZWdp
c3RlcnMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCXJldHVybiByZXBseV9jYih2Y3B1LCBtc2cs
IGVyciwgTlVMTCwgMCk7CiB9CiAKK3N0YXRpYyBpbnQgaGFuZGxlX2luamVjdF9leGNlcHRpb24o
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LAorCQkJCSAgIGNvbnN0IHN0cnVjdCBrdm1pX21zZ19oZHIg
Km1zZywKKwkJCQkgICBjb25zdCB2b2lkICpfcmVxLAorCQkJCSAgIHZjcHVfcmVwbHlfZmN0IHJl
cGx5X2NiKQoreworCWNvbnN0IHN0cnVjdCBrdm1pX2luamVjdF9leGNlcHRpb24gKnJlcSA9IF9y
ZXE7CisJaW50IGVjOworCisJaWYgKHJlcS0+cGFkZGluZykKKwkJZWMgPSAtS1ZNX0VJTlZBTDsK
KwllbHNlCisJCWVjID0ga3ZtaV9hcmNoX2NtZF9pbmplY3RfZXhjZXB0aW9uKHZjcHUsIHJlcS0+
bnIsCisJCQkJCQkgICAgcmVxLT5oYXNfZXJyb3IsCisJCQkJCQkgICAgcmVxLT5lcnJvcl9jb2Rl
LAorCQkJCQkJICAgIHJlcS0+YWRkcmVzcyk7CisKKwlyZXR1cm4gcmVwbHlfY2IodmNwdSwgbXNn
LCBlYywgTlVMTCwgMCk7Cit9CisKIHN0YXRpYyBpbnQgaGFuZGxlX2NvbnRyb2xfZXZlbnRzKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAkJCQkgY29uc3Qgc3RydWN0IGt2bWlfbXNnX2hkciAqbXNn
LAogCQkJCSBjb25zdCB2b2lkICpfcmVxLApAQCAtNjcwLDYgKzY5MCw3IEBAIHN0YXRpYyBpbnQo
KmNvbnN0IG1zZ192Y3B1W10pKHN0cnVjdCBrdm1fdmNwdSAqLAogCVtLVk1JX0dFVF9DUFVJRF0g
ICAgICAgID0gaGFuZGxlX2dldF9jcHVpZCwKIAlbS1ZNSV9HRVRfUkVHSVNURVJTXSAgICA9IGhh
bmRsZV9nZXRfcmVnaXN0ZXJzLAogCVtLVk1JX0dFVF9WQ1BVX0lORk9dICAgID0gaGFuZGxlX2dl
dF92Y3B1X2luZm8sCisJW0tWTUlfSU5KRUNUX0VYQ0VQVElPTl0gPSBoYW5kbGVfaW5qZWN0X2V4
Y2VwdGlvbiwKIAlbS1ZNSV9TRVRfUkVHSVNURVJTXSAgICA9IGhhbmRsZV9zZXRfcmVnaXN0ZXJz
LAogfTsKIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
