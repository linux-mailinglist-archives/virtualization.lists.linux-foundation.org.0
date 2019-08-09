Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A5388235
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 20:20:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B303EE2E;
	Fri,  9 Aug 2019 18:19:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2F7EEDAF
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:19:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 749F989D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:19:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	60BF3305D3D5; Fri,  9 Aug 2019 19:00:57 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id E7403305B7A4;
	Fri,  9 Aug 2019 19:00:56 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 14/92] kvm: introspection: handle introspection
	commands before returning to guest
Date: Fri,  9 Aug 2019 18:59:29 +0300
Message-Id: <20190809160047.8319-15-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?q?Samuel=20Laur=C3=A9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org,
	=?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Mircea=20C=C3=AErjaliu?= <mcirjaliu@bitdefender.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Zhang@mail.linuxfoundation.org,
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhlIGludHJvc3Bl
Y3Rpb24gcmVxdWVzdHMgKEtWTV9SRVFfSU5UUk9TUEVDVElPTikgYXJlIGNoZWNrZWQgYnkgYW55
CmludHJvc3BlY3RlZCB2Q1BVIGluIHR3byBwbGFjZXM6CgogICogb24gaXRzIHdheSB0byBndWVz
dCAtIHZjcHVfZW50ZXJfZ3Vlc3QoKQogICogd2hlbiBoYWx0ZWQgLSBrdm1fdmNwdV9ibG9jaygp
CgpJbiBrdm1fdmNwdV9ibG9jaygpLCB3ZSBjaGVjayB0byBzZWUgaWYgdGhlcmUgYXJlIGFueSBp
bnRyb3NwZWN0aW9uCnJlcXVlc3RzIGR1cmluZyB0aGUgc3dhaXQgbG9vcCwgaGFuZGxlIHRoZW0g
b3V0c2lkZSBvZiBzd2FpdCBsb29wIGFuZApzdGFydCBzd2FpdCBhZ2Fpbi4KClNpZ25lZC1vZmYt
Ynk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KQ28tZGV2ZWxvcGVkLWJ5
OiBNaXJjZWEgQ8OucmphbGl1IDxtY2lyamFsaXVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2Zm
LWJ5OiBNaXJjZWEgQ8OucmphbGl1IDxtY2lyamFsaXVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQt
b2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJj
aC94ODYva3ZtL3g4Ni5jICAgfCAgMyArKysKIGluY2x1ZGUvbGludXgva3ZtaS5oIHwgIDIgKysK
IHZpcnQva3ZtL2t2bV9tYWluLmMgIHwgMjggKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQog
MyBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwppbmRleCAwMTYz
ZTFhZDFhYWEuLmFkYmRiMWNlYjYxOCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCisr
KyBiL2FyY2gveDg2L2t2bS94ODYuYwpAQCAtNzc0Miw2ICs3NzQyLDkgQEAgc3RhdGljIGludCB2
Y3B1X2VudGVyX2d1ZXN0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAkJICovCiAJCWlmIChrdm1f
Y2hlY2tfcmVxdWVzdChLVk1fUkVRX0hWX1NUSU1FUiwgdmNwdSkpCiAJCQlrdm1faHZfcHJvY2Vz
c19zdGltZXJzKHZjcHUpOworCisJCWlmIChrdm1fY2hlY2tfcmVxdWVzdChLVk1fUkVRX0lOVFJP
U1BFQ1RJT04sIHZjcHUpKQorCQkJa3ZtaV9oYW5kbGVfcmVxdWVzdHModmNwdSk7CiAJfQogCiAJ
aWYgKGt2bV9jaGVja19yZXF1ZXN0KEtWTV9SRVFfRVZFTlQsIHZjcHUpIHx8IHJlcV9pbnRfd2lu
KSB7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bWkuaCBiL2luY2x1ZGUvbGludXgva3Zt
aS5oCmluZGV4IGU4ZDI1ZDdkYTc1MS4uYWU1ZGUxOTA1YjU1IDEwMDY0NAotLS0gYS9pbmNsdWRl
L2xpbnV4L2t2bWkuaAorKysgYi9pbmNsdWRlL2xpbnV4L2t2bWkuaApAQCAtMTYsNiArMTYsNyBA
QCBpbnQga3ZtaV9pb2N0bF9ldmVudChzdHJ1Y3Qga3ZtICprdm0sIHZvaWQgX191c2VyICphcmdw
KTsKIGludCBrdm1pX2lvY3RsX3VuaG9vayhzdHJ1Y3Qga3ZtICprdm0sIGJvb2wgZm9yY2VfcmVz
ZXQpOwogaW50IGt2bWlfdmNwdV9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiB2b2lkIGt2
bWlfdmNwdV91bmluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKK3ZvaWQga3ZtaV9oYW5kbGVf
cmVxdWVzdHMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAogI2Vsc2UKIApAQCAtMjUsNiArMjYs
NyBAQCBzdGF0aWMgaW5saW5lIHZvaWQga3ZtaV9jcmVhdGVfdm0oc3RydWN0IGt2bSAqa3ZtKSB7
IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1pX2Rlc3Ryb3lfdm0oc3RydWN0IGt2bSAqa3ZtKSB7
IH0KIHN0YXRpYyBpbmxpbmUgaW50IGt2bWlfdmNwdV9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSkgeyByZXR1cm4gMDsgfQogc3RhdGljIGlubGluZSB2b2lkIGt2bWlfdmNwdV91bmluaXQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KSB7IH0KK3N0YXRpYyBpbmxpbmUgdm9pZCBrdm1pX2hhbmRsZV9y
ZXF1ZXN0cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpIHsgfQogCiAjZW5kaWYgLyogQ09ORklHX0tW
TV9JTlRST1NQRUNUSU9OICovCiAKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92
aXJ0L2t2bS9rdm1fbWFpbi5jCmluZGV4IDk0ZjE1ZjM5M2UzNy4uMmUxMTA2OWI5NTY1IDEwMDY0
NAotLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5jCisrKyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKQEAg
LTIyODIsMTYgKzIyODIsMzIgQEAgdm9pZCBrdm1fdmNwdV9ibG9jayhzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCiAJa3ZtX2FyY2hfdmNwdV9ibG9ja2luZyh2Y3B1KTsKIAogCWZvciAoOzspIHsKLQkJ
cHJlcGFyZV90b19zd2FpdF9leGNsdXNpdmUoJnZjcHUtPndxLCAmd2FpdCwgVEFTS19JTlRFUlJV
UFRJQkxFKTsKKwkJYm9vbCBkb19rdm1pX3dvcmsgPSBmYWxzZTsKIAotCQlpZiAoa3ZtX3ZjcHVf
Y2hlY2tfYmxvY2sodmNwdSkgPCAwKQotCQkJYnJlYWs7CisJCWZvciAoOzspIHsKKwkJCXByZXBh
cmVfdG9fc3dhaXRfZXhjbHVzaXZlKCZ2Y3B1LT53cSwgJndhaXQsCisJCQkJCQkgICBUQVNLX0lO
VEVSUlVQVElCTEUpOworCisJCQlpZiAoa3ZtX3ZjcHVfY2hlY2tfYmxvY2sodmNwdSkgPCAwKQor
CQkJCWJyZWFrOworCisJCQl3YWl0ZWQgPSB0cnVlOworCQkJc2NoZWR1bGUoKTsKKworCQkJaWYg
KGt2bV9jaGVja19yZXF1ZXN0KEtWTV9SRVFfSU5UUk9TUEVDVElPTiwgdmNwdSkpIHsKKwkJCQlk
b19rdm1pX3dvcmsgPSB0cnVlOworCQkJCWJyZWFrOworCQkJfQorCQl9CiAKLQkJd2FpdGVkID0g
dHJ1ZTsKLQkJc2NoZWR1bGUoKTsKKwkJZmluaXNoX3N3YWl0KCZ2Y3B1LT53cSwgJndhaXQpOwor
CisJCWlmIChkb19rdm1pX3dvcmspCisJCQlrdm1pX2hhbmRsZV9yZXF1ZXN0cyh2Y3B1KTsKKwkJ
ZWxzZQorCQkJYnJlYWs7CiAJfQogCi0JZmluaXNoX3N3YWl0KCZ2Y3B1LT53cSwgJndhaXQpOwog
CWN1ciA9IGt0aW1lX2dldCgpOwogCiAJa3ZtX2FyY2hfdmNwdV91bmJsb2NraW5nKHZjcHUpOwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
