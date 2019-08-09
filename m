Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1577587F79
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 18:17:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E7BA3E55;
	Fri,  9 Aug 2019 16:15:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C6423E45
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:15:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id CABA41DD19
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:14:59 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	C10A8305D349; Fri,  9 Aug 2019 19:01:18 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 77BCD305B7A1;
	Fri,  9 Aug 2019 19:01:18 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 48/92] kvm: add kvm_vcpu_kick_and_wait()
Date: Fri,  9 Aug 2019 19:00:03 +0300
Message-Id: <20190809160047.8319-49-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
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
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
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

VGhpcyBmdW5jdGlvbiBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX1BBVVNFX1ZDUFUgY29tbWFuZC4g
VGhlcmUgYXJlCmNhc2VzIHdoZW4gaXQgaXMgZWFzaWVyIGZvciB0aGUgaW50cm9zcGVjdGlvbiB0
b29sIGlmIGl0IGtub3dzIHRoYXQKdGhlIHZDUFUgZG9lc24ndCBydW4gZ3Vlc3QgY29kZSB3aGVu
IHRoZSBjb21tYW5kIGlzIGNvbXBsZXRlZCwgd2l0aG91dAp3YWl0aW5nIGZvciB0aGUgS1ZNSV9F
VkVOVF9QQVVTRV9WQ1BVIGV2ZW50LgoKU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxh
bGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGluY2x1ZGUvbGludXgva3ZtX2hvc3QuaCB8ICAx
ICsKIHZpcnQva3ZtL2t2bV9tYWluLmMgICAgICB8IDEwICsrKysrKysrKysKIDIgZmlsZXMgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hv
c3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAppbmRleCBhZTQxMDZhYWUxNmUuLjA5YmMw
Njc0NzY0MiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCisrKyBiL2luY2x1
ZGUvbGludXgva3ZtX2hvc3QuaApAQCAtNzM4LDYgKzczOCw3IEBAIHZvaWQga3ZtX2FyY2hfdmNw
dV9ibG9ja2luZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1fYXJjaF92Y3B1X3Vu
YmxvY2tpbmcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIGJvb2wga3ZtX3ZjcHVfd2FrZV91cChz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1fdmNwdV9raWNrKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSk7Cit2b2lkIGt2bV92Y3B1X2tpY2tfYW5kX3dhaXQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KTsKIGludCBrdm1fdmNwdV95aWVsZF90byhzdHJ1Y3Qga3ZtX3ZjcHUgKnRhcmdldCk7CiB2
b2lkIGt2bV92Y3B1X29uX3NwaW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIHVzZXJtb2Rl
X3ZjcHVfbm90X2VsaWdpYmxlKTsKIApkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBi
L3ZpcnQva3ZtL2t2bV9tYWluLmMKaW5kZXggMmUxMTA2OWI5NTY1Li41MjU2ZDczMjFkMGUgMTAw
NjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwpA
QCAtMjM3MCw2ICsyMzcwLDE2IEBAIHZvaWQga3ZtX3ZjcHVfa2ljayhzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCiBFWFBPUlRfU1lNQk9MX0dQTChrdm1fdmNwdV9raWNrKTsKICNlbmRpZiAvKiAhQ09O
RklHX1MzOTAgKi8KIAordm9pZCBrdm1fdmNwdV9raWNrX2FuZF93YWl0KHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKK3sKKwlpZiAoa3ZtX3ZjcHVfd2FrZV91cCh2Y3B1KSkKKwkJcmV0dXJuOworCisJ
aWYgKGt2bV9yZXF1ZXN0X25lZWRzX2lwaSh2Y3B1LCBLVk1fUkVRVUVTVF9XQUlUKSkKKwkJc21w
X2NhbGxfZnVuY3Rpb25fc2luZ2xlKHZjcHUtPmNwdSwgYWNrX2ZsdXNoLCBOVUxMLCAxKTsKK30K
K0VYUE9SVF9TWU1CT0xfR1BMKGt2bV92Y3B1X2tpY2tfYW5kX3dhaXQpOworCiBpbnQga3ZtX3Zj
cHVfeWllbGRfdG8oc3RydWN0IGt2bV92Y3B1ICp0YXJnZXQpCiB7CiAJc3RydWN0IHBpZCAqcGlk
OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
