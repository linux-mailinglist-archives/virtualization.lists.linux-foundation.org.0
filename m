Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AC65A87F06
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 18:10:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 34347E21;
	Fri,  9 Aug 2019 16:09:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CC367D8B
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:09:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 62948875
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 16:09:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	8379A301AB43; Fri,  9 Aug 2019 19:00:53 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 43B2A305B7A3;
	Fri,  9 Aug 2019 19:00:53 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 04/92] kvm: introspection: add the read/dispatch
	message function
Date: Fri,  9 Aug 2019 18:59:19 +0300
Message-Id: <20190809160047.8319-5-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
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

QmFzZWQgb24gdGhlIGNvbW1vbiBoZWFkZXIgdXNlZCBieSBhbGwgbWVzc2FnZXMgKHN0cnVjdCBr
dm1pX21zZ19oZHIpLAp0aGUgd29ya2VyIHdpbGwgcmVhZC92YWxpZGF0ZSBhbGwgbWVzc2FnZXMs
IGV4ZWN1dGUgdGhlIFZNIGludHJvc3BlY3Rpb24KY29tbWFuZHMgKGVnLiBLVk1JX0dFVF9HVUVT
VF9JTkZPKSBhbmQgZGlzcGF0Y2ggdG8gdkNQVXMgdGhlIHZDUFUKaW50cm9zcGVjdGlvbiBjb21t
YW5kcyAoZWcuIEtWTUlfR0VUX1JFR0lTVEVSUykgYW5kIHRoZSByZXBsaWVzIHRvCnZDUFUgZXZl
bnRzLiBUaGUgdkNQVSB0aHJlYWRzIHdpbGwgcmVwbHkgdG8gdkNQVSBpbnRyb3NwZWN0aW9uIGNv
bW1hbmRzCndpdGhvdXQgdGhlIGhlbHAgb2YgdGhlIHJlY2VpdmluZyB3b3JrZXIuCgpCZWNhdXNl
IG9mIHRoZSBjb21tYW5kIGhlYWRlciAoc3RydWN0IGt2bWlfZXJyb3JfY29kZSkgdXNlZCBpbiBh
bnkKY29tbWFuZCByZXBseSwgdGhpcyB3b3JrZXIgY291bGQgcmVzcG9uZCB0byBhbnkgdW5zdXBw
b3J0ZWQvZGlzYWxsb3dlZApjb21tYW5kIHdpdGggYW4gZXJyb3IgY29kZS4KClRoaXMgdGhyZWFk
IHdpbGwgZW5kIHdoZW4gdGhlIHNvY2tldCBpcyBjbG9zZWQgKHNpZ25hbGVkIGJ5IHVzZXJzcGFj
ZS9RRU1VCm9yIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wpIG9yIG9uIHRoZSBmaXJzdCBBUEkgZXJy
b3IgKGVnLiB3cm9uZyBtZXNzYWdlCnNpemUpLgoKU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6
xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIERvY3VtZW50YXRpb24vdmlydHVhbC9r
dm0va3ZtaS5yc3QgfCAgODYgKysrKysrKysrKysKIGluY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgg
ICAgICAgICAgfCAgMTMgKysKIHZpcnQva3ZtL2t2bWkuYyAgICAgICAgICAgICAgICAgICAgfCAg
NDMgKysrKystCiB2aXJ0L2t2bS9rdm1pX2ludC5oICAgICAgICAgICAgICAgIHwgICA3ICsKIHZp
cnQva3ZtL2t2bWlfbXNnLmMgICAgICAgICAgICAgICAgfCAyNDAgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0KIDUgZmlsZXMgY2hhbmdlZCwgMzg2IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0dWFsL2t2bS9rdm1pLnJzdCBi
L0RvY3VtZW50YXRpb24vdmlydHVhbC9rdm0va3ZtaS5yc3QKaW5kZXggNDdiN2MzNmQzMzRhLi4x
ZDRhMWRjZDdkMmYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydHVhbC9rdm0va3ZtaS5y
c3QKKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0dWFsL2t2bS9rdm1pLnJzdApAQCAtNjQsNiArNjQs
ODUgQEAgdXNlZCBvbiB0aGF0IGd1ZXN0LiBPYnZpb3VzbHksIHdoZXRoZXIgdGhlIGd1ZXN0IGNh
biByZWFsbHkgY29udGludWUKIG5vcm1hbCBleGVjdXRpb24gZGVwZW5kcyBvbiB3aGV0aGVyIHRo
ZSBpbnRyb3NwZWN0aW9uIHRvb2wgaGFzIG1hZGUgYW55CiBtb2RpZmljYXRpb25zIHRoYXQgcmVx
dWlyZSBhbiBhY3RpdmUgS1ZNSSBjaGFubmVsLgogCitBbGwgbWVzc2FnZXMgKGNvbW1hbmRzIG9y
IGV2ZW50cykgaGF2ZSBhIGNvbW1vbiBoZWFkZXI6OgorCisJc3RydWN0IGt2bWlfbXNnX2hkciB7
CisJCV9fdTE2IGlkOworCQlfX3UxNiBzaXplOworCQlfX3UzMiBzZXE7CisJfTsKKworVGhlIHJl
cGxpZXMgaGF2ZSB0aGUgc2FtZSBoZWFkZXIsIHdpdGggdGhlIHNlcXVlbmNlIG51bWJlciAoYGBz
ZXFgYCkKK2FuZCBtZXNzYWdlIGlkIChgYGlkYGApIG1hdGNoaW5nIHRoZSBjb21tYW5kL2V2ZW50
LgorCitBZnRlciBgYGt2bWlfbXNnX2hkcmBgLCBgYGlkYGAgc3BlY2lmaWMgZGF0YSBvZiBgYHNp
emVgYCBieXRlcyB3aWxsCitmb2xsb3cuCisKK1RoZSBtZXNzYWdlIGhlYWRlciBhbmQgaXRzIGRh
dGEgbXVzdCBiZSBzZW50IHdpdGggb25lIGBgc2VuZG1zZygpYGAgY2FsbAordG8gdGhlIHNvY2tl
dC4gVGhpcyBzaW1wbGlmaWVzIHRoZSByZWNlaXZlciBsb29wIGFuZCBhdm9pZHMKK3RoZSByZWNv
bnN0cnVjdGlvbiBvZiBtZXNzYWdlcyBvbiB0aGUgb3RoZXIgc2lkZS4KKworVGhlIHdpcmUgcHJv
dG9jb2wgdXNlcyB0aGUgaG9zdCBuYXRpdmUgYnl0ZS1vcmRlci4gVGhlIGludHJvc3BlY3Rpb24g
dG9vbAorbXVzdCBjaGVjayB0aGlzIGR1cmluZyB0aGUgaGFuZHNoYWtlIGFuZCBkbyB0aGUgbmVj
ZXNzYXJ5IGNvbnZlcnNpb24uCisKK0EgY29tbWFuZCByZXBseSBiZWdpbnMgd2l0aDo6CisKKwlz
dHJ1Y3Qga3ZtaV9lcnJvcl9jb2RlIHsKKwkJX19zMzIgZXJyOworCQlfX3UzMiBwYWRkaW5nOwor
CX0KKworZm9sbG93ZWQgYnkgdGhlIGNvbW1hbmQgc3BlY2lmaWMgZGF0YSBpZiB0aGUgZXJyb3Ig
Y29kZSBgYGVycmBgIGlzIHplcm8uCisKK1RoZSBlcnJvciBjb2RlIC1LVk1fRU9QTk9UU1VQUCBp
cyByZXR1cm5lZCBmb3IgdW5zdXBwb3J0ZWQgY29tbWFuZHMuCisKK1RoZSBlcnJvciBjb2RlIC1L
Vk1fRVBFUk0gaXMgcmV0dXJuZWQgZm9yIGRpc2FsbG93ZWQgY29tbWFuZHMgKHNlZSAqKkhvb2tp
bmcqKikuCisKK1RoZSBlcnJvciBjb2RlIGlzIHJlbGF0ZWQgdG8gdGhlIG1lc3NhZ2UgcHJvY2Vz
c2luZywgaW5jbHVkaW5nIHVuc3VwcG9ydGVkCitjb21tYW5kcy4gRm9yIGFsbCB0aGUgb3RoZXIg
ZXJyb3JzIChpbmNvbXBsZXRlIG1lc3NhZ2VzLCB3cm9uZyBzZXF1ZW5jZQorbnVtYmVycywgc29j
a2V0IGVycm9ycyBldGMuKSB0aGUgc29ja2V0IHdpbGwgYmUgY2xvc2VkLiBUaGUgZGV2aWNlCitt
YW5hZ2VyIHNob3VsZCByZWNvbm5lY3QuCisKK1doaWxlIGFsbCBjb21tYW5kcyB3aWxsIGhhdmUg
YSByZXBseSBhcyBzb29uIGFzIHBvc3NpYmxlLCB0aGUgcmVwbGllcwordG8gZXZlbnRzIHdpbGwg
cHJvYmFibHkgYmUgZGVsYXllZCB1bnRpbCBhIHNldCBvZiAobmV3KSBjb21tYW5kcyB3aWxsCitj
b21wbGV0ZTo6CisKKyAgIEhvc3Qga2VybmVsICAgICAgICAgICAgICAgVG9vbAorICAgLS0tLS0t
LS0tLS0gICAgICAgICAgICAgICAtLS0tCisgICBldmVudCAxIC0+CisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDwtIGNvbW1hbmQgMQorICAgY29tbWFuZCAxIHJlcGx5IC0+CisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwtIGNvbW1hbmQgMgorICAgY29tbWFuZCAyIHJlcGx5IC0+
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwtIGV2ZW50IDEgcmVwbHkKKworSWYgYm90
aCBlbmRzIHNlbmQgYSBtZXNzYWdlIGF0IHRoZSBzYW1lIHRpbWU6OgorCisgICBIb3N0IGtlcm5l
bCAgICAgICAgICAgICAgIFRvb2wKKyAgIC0tLS0tLS0tLS0tICAgICAgICAgICAgICAgLS0tLQor
ICAgZXZlbnQgWCAtPiAgICAgICAgICAgICAgICA8LSBjb21tYW5kIFgKKwordGhlIGhvc3Qga2Vy
bmVsIHdpbGwgcmVwbHkgdG8gJ2NvbW1hbmQgWCcsIHJlZ2FyZGxlc3Mgb2YgdGhlIHJlY2VpdmUg
dGltZQorKGJlZm9yZSBvciBhZnRlciB0aGUgJ2V2ZW50IFgnIHdhcyBzZW50KS4KKworQXMgaXQg
Y2FuIGJlIHNlZW4gYmVsb3csIHRoZSB3aXJlIHByb3RvY29sIHNwZWNpZmllcyBvY2Nhc2lvbmFs
IHBhZGRpbmcuIFRoaXMKK2lzIHRvIHBlcm1pdCB3b3JraW5nIHdpdGggdGhlIGRhdGEgYnkgZGly
ZWN0bHkgdXNpbmcgQyBzdHJ1Y3R1cmVzIG9yIHRvIHJvdW5kCit0aGUgc3RydWN0dXJlIHNpemUg
dG8gYSBtdWx0aXBsZSBvZiA4IGJ5dGVzICg2NGJpdCkgdG8gaW1wcm92ZSB0aGUgY29weQorb3Bl
cmF0aW9ucyB0aGF0IGhhcHBlbiBkdXJpbmcgYGByZWN2bXNnKClgYCBvciBgYHNlbmRtc2coKWBg
LiBUaGUgbWVtYmVycworc2hvdWxkIGhhdmUgdGhlIG5hdGl2ZSBhbGlnbm1lbnQgb2YgdGhlIGhv
c3QgKDQgYnl0ZXMgb24geDg2KS4gQWxsIHBhZGRpbmcKK211c3QgYmUgaW5pdGlhbGl6ZWQgd2l0
aCB6ZXJvIG90aGVyd2lzZSB0aGUgcmVzcGVjdGl2ZSBjb21tYW5kcyB3aWxsIGZhaWwKK3dpdGgg
LUtWTV9FSU5WQUwuCisKK1RvIGRlc2NyaWJlIHRoZSBjb21tYW5kcy9ldmVudHMsIHdlIHJldXNl
IHNvbWUgY29udmVudGlvbnMgZnJvbSBhcGkudHh0OgorCisgIC0gQXJjaGl0ZWN0dXJlczogd2hp
Y2ggaW5zdHJ1Y3Rpb24gc2V0IGFyY2hpdGVjdHVyZXMgcHJvdmlkZSB0aGlzIGNvbW1hbmQvZXZl
bnQKKworICAtIFZlcnNpb25zOiB3aGljaCB2ZXJzaW9ucyBwcm92aWRlIHRoaXMgY29tbWFuZC9l
dmVudAorCisgIC0gUGFyYW1ldGVyczogaW5jb21pbmcgbWVzc2FnZSBkYXRhCisKKyAgLSBSZXR1
cm5zOiBvdXRnb2luZy9yZXBseSBtZXNzYWdlIGRhdGEKKwogSGFuZHNoYWtlCiAtLS0tLS0tLS0K
IApAQCAtOTksNiArMTc4LDEzIEBAIGNvbW1hbmRzL2V2ZW50cykgdG8gS1ZNLCBhbmQgZm9yZ2V0
IGFib3V0IGl0LiBJdCB3aWxsIGJlIG5vdGlmaWVkIGJ5CiBLVk0gd2hlbiB0aGUgaW50cm9zcGVj
dGlvbiB0b29sIGNsb3NlcyB0aGUgZmlsZSBoYW5kbGUgKGluIGNhc2Ugb2YKIGVycm9ycyksIGFu
ZCBzaG91bGQgcmVpbml0aWF0ZSB0aGUgaGFuZHNoYWtlLgogCitPbmNlIHRoZSBmaWxlIGhhbmRs
ZSByZWFjaGVzIEtWTSwgdGhlIGludHJvc3BlY3Rpb24gdG9vbCBzaG91bGQgdXNlCit0aGUgKktW
TUlfR0VUX1ZFUlNJT04qIGNvbW1hbmQgdG8gZ2V0IHRoZSBBUEkgdmVyc2lvbiBhbmQvb3IKK3Ro
ZSAqS1ZNSV9DSEVDS19DT01NQU5EKiBhbmQgKktWTUlfQ0hFQ0tfRVZFTlRTKiBjb21tYW5kcyB0
byBzZWUgd2hpY2gKK2NvbW1hbmRzL2V2ZW50cyBhcmUgYWxsb3dlZCBmb3IgdGhpcyBndWVzdC4g
VGhlIGVycm9yIGNvZGUgLUtWTV9FUEVSTQord2lsbCBiZSByZXR1cm5lZCBpZiB0aGUgaW50cm9z
cGVjdGlvbiB0b29sIHVzZXMgYSBjb21tYW5kIG9yIGVuYWJsZXMgYW4KK2V2ZW50IHdoaWNoIGlz
IGRpc2FsbG93ZWQuCisKIFVuaG9va2luZwogLS0tLS0tLS0tCiAKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdWFwaS9saW51eC9rdm1pLmggYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCmluZGV4IGRi
ZjYzYWQwODYyZi4uNmM3NjAwZWQ0NTY0IDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgv
a3ZtaS5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKQEAgLTY1LDQgKzY1LDE3IEBA
IGVudW0gewogCUtWTUlfTlVNX0VWRU5UUwogfTsKIAorI2RlZmluZSBLVk1JX01TR19TSVpFICg0
MDk2IC0gc2l6ZW9mKHN0cnVjdCBrdm1pX21zZ19oZHIpKQorCitzdHJ1Y3Qga3ZtaV9tc2dfaGRy
IHsKKwlfX3UxNiBpZDsKKwlfX3UxNiBzaXplOworCV9fdTMyIHNlcTsKK307CisKK3N0cnVjdCBr
dm1pX2Vycm9yX2NvZGUgeworCV9fczMyIGVycjsKKwlfX3UzMiBwYWRkaW5nOworfTsKKwogI2Vu
ZGlmIC8qIF9VQVBJX19MSU5VWF9LVk1JX0ggKi8KZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bWku
YyBiL3ZpcnQva3ZtL2t2bWkuYwppbmRleCBkYzY0Zjk3NTk5OGYuLmFmYTMxNzQ4ZDdmNCAxMDA2
NDQKLS0tIGEvdmlydC9rdm0va3ZtaS5jCisrKyBiL3ZpcnQva3ZtL2t2bWkuYwpAQCAtMTAsMTMg
KzEwLDU0IEBACiAjaW5jbHVkZSA8bGludXgva3RocmVhZC5oPgogI2luY2x1ZGUgPGxpbnV4L2Jp
dG1hcC5oPgogCi1pbnQga3ZtaV9pbml0KHZvaWQpCitzdGF0aWMgc3RydWN0IGttZW1fY2FjaGUg
Km1zZ19jYWNoZTsKKwordm9pZCAqa3ZtaV9tc2dfYWxsb2Modm9pZCkKK3sKKwlyZXR1cm4ga21l
bV9jYWNoZV96YWxsb2MobXNnX2NhY2hlLCBHRlBfS0VSTkVMKTsKK30KKwordm9pZCAqa3ZtaV9t
c2dfYWxsb2NfY2hlY2soc2l6ZV90IHNpemUpCit7CisJaWYgKHNpemUgPiBLVk1JX01TR19TSVpF
X0FMTE9DKQorCQlyZXR1cm4gTlVMTDsKKwlyZXR1cm4ga3ZtaV9tc2dfYWxsb2MoKTsKK30KKwor
dm9pZCBrdm1pX21zZ19mcmVlKHZvaWQgKmFkZHIpCit7CisJaWYgKGFkZHIpCisJCWttZW1fY2Fj
aGVfZnJlZShtc2dfY2FjaGUsIGFkZHIpOworfQorCitzdGF0aWMgdm9pZCBrdm1pX2NhY2hlX2Rl
c3Ryb3kodm9pZCkKIHsKKwlrbWVtX2NhY2hlX2Rlc3Ryb3kobXNnX2NhY2hlKTsKKwltc2dfY2Fj
aGUgPSBOVUxMOworfQorCitzdGF0aWMgaW50IGt2bWlfY2FjaGVfY3JlYXRlKHZvaWQpCit7CisJ
bXNnX2NhY2hlID0ga21lbV9jYWNoZV9jcmVhdGUoImt2bWlfbXNnIiwgS1ZNSV9NU0dfU0laRV9B
TExPQywKKwkJCQkgICAgICA0MDk2LCBTTEFCX0FDQ09VTlQsIE5VTEwpOworCisJaWYgKCFtc2df
Y2FjaGUpIHsKKwkJa3ZtaV9jYWNoZV9kZXN0cm95KCk7CisKKwkJcmV0dXJuIC0xOworCX0KKwog
CXJldHVybiAwOwogfQogCitpbnQga3ZtaV9pbml0KHZvaWQpCit7CisJcmV0dXJuIGt2bWlfY2Fj
aGVfY3JlYXRlKCk7Cit9CisKIHZvaWQga3ZtaV91bmluaXQodm9pZCkKIHsKKwlrdm1pX2NhY2hl
X2Rlc3Ryb3koKTsKIH0KIAogc3RhdGljIGJvb2wgYWxsb2Nfa3ZtaShzdHJ1Y3Qga3ZtICprdm0s
IGNvbnN0IHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqcWVtdSkKZGlmZiAtLWdpdCBhL3ZpcnQv
a3ZtL2t2bWlfaW50LmggYi92aXJ0L2t2bS9rdm1pX2ludC5oCmluZGV4IGJkOGI1MzllOTE3YS4u
NzYxMTlhNGI2OWQ4IDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1pX2ludC5oCisrKyBiL3ZpcnQv
a3ZtL2t2bWlfaW50LmgKQEAgLTIzLDYgKzIzLDggQEAKICNkZWZpbmUga3ZtaV9lcnIoaWt2bSwg
Zm10LCAuLi4pIFwKIAlrdm1faW5mbygiJXBVIEVSUk9SOiAiIGZtdCwgJmlrdm0tPnV1aWQsICMj
IF9fVkFfQVJHU19fKQogCisjZGVmaW5lIEtWTUlfTVNHX1NJWkVfQUxMT0MgKHNpemVvZihzdHJ1
Y3Qga3ZtaV9tc2dfaGRyKSArIEtWTUlfTVNHX1NJWkUpCisKICNkZWZpbmUgS1ZNSV9LTk9XTl9W
Q1BVX0VWRU5UUyAoIFwKIAkJQklUKEtWTUlfRVZFTlRfQ1IpIHwgXAogCQlCSVQoS1ZNSV9FVkVO
VF9NU1IpIHwgXApAQCAtOTEsNCArOTMsOSBAQCB2b2lkIGt2bWlfc29ja19zaHV0ZG93bihzdHJ1
Y3Qga3ZtaSAqaWt2bSk7CiB2b2lkIGt2bWlfc29ja19wdXQoc3RydWN0IGt2bWkgKmlrdm0pOwog
Ym9vbCBrdm1pX21zZ19wcm9jZXNzKHN0cnVjdCBrdm1pICppa3ZtKTsKIAorLyoga3ZtaS5jICov
Cit2b2lkICprdm1pX21zZ19hbGxvYyh2b2lkKTsKK3ZvaWQgKmt2bWlfbXNnX2FsbG9jX2NoZWNr
KHNpemVfdCBzaXplKTsKK3ZvaWQga3ZtaV9tc2dfZnJlZSh2b2lkICphZGRyKTsKKwogI2VuZGlm
CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1pX21zZy5jIGIvdmlydC9rdm0va3ZtaV9tc2cuYwpp
bmRleCA0ZGUwMTJlYWZiNmQuLmFmNmJjNDdkYzAzMSAxMDA2NDQKLS0tIGEvdmlydC9rdm0va3Zt
aV9tc2cuYworKysgYi92aXJ0L2t2bS9rdm1pX21zZy5jCkBAIC04LDYgKzgsMTkgQEAKICNpbmNs
dWRlIDxsaW51eC9uZXQuaD4KICNpbmNsdWRlICJrdm1pX2ludC5oIgogCitzdGF0aWMgY29uc3Qg
Y2hhciAqY29uc3QgbXNnX0lEc1tdID0geworfTsKKworc3RhdGljIGJvb2wgaXNfa25vd25fbWVz
c2FnZSh1MTYgaWQpCit7CisJcmV0dXJuIGlkIDwgQVJSQVlfU0laRShtc2dfSURzKSAmJiBtc2df
SURzW2lkXTsKK30KKworc3RhdGljIGNvbnN0IGNoYXIgKmlkMnN0cih1MTYgaWQpCit7CisJcmV0
dXJuIGlzX2tub3duX21lc3NhZ2UoaWQpID8gbXNnX0lEc1tpZF0gOiAidW5rbm93biI7Cit9CisK
IGJvb2wga3ZtaV9zb2NrX2dldChzdHJ1Y3Qga3ZtaSAqaWt2bSwgaW50IGZkKQogewogCXN0cnVj
dCBzb2NrZXQgKnNvY2s7CkBAIC0zNSw4ICs0OCwyMzEgQEAgdm9pZCBrdm1pX3NvY2tfc2h1dGRv
d24oc3RydWN0IGt2bWkgKmlrdm0pCiAJa2VybmVsX3NvY2tfc2h1dGRvd24oaWt2bS0+c29jaywg
U0hVVF9SRFdSKTsKIH0KIAorc3RhdGljIGludCBrdm1pX3NvY2tfcmVhZChzdHJ1Y3Qga3ZtaSAq
aWt2bSwgdm9pZCAqYnVmLCBzaXplX3Qgc2l6ZSkKK3sKKwlzdHJ1Y3Qga3ZlYyBpID0geworCQku
aW92X2Jhc2UgPSBidWYsCisJCS5pb3ZfbGVuID0gc2l6ZSwKKwl9OworCXN0cnVjdCBtc2doZHIg
bSA9IHsgfTsKKwlpbnQgcmM7CisKKwlyYyA9IGtlcm5lbF9yZWN2bXNnKGlrdm0tPnNvY2ssICZt
LCAmaSwgMSwgc2l6ZSwgTVNHX1dBSVRBTEwpOworCisJaWYgKHJjID4gMCkKKwkJcHJpbnRfaGV4
X2R1bXBfZGVidWcoInJlYWQ6ICIsIERVTVBfUFJFRklYX05PTkUsIDMyLCAxLAorCQkJCQlidWYs
IHJjLCBmYWxzZSk7CisKKwlpZiAodW5saWtlbHkocmMgIT0gc2l6ZSkpIHsKKwkJaWYgKHJjID49
IDApCisJCQlyYyA9IC1FUElQRTsKKwkJZWxzZQorCQkJa3ZtaV9lcnIoaWt2bSwgImtlcm5lbF9y
ZWN2bXNnOiAlZFxuIiwgcmMpOworCQlyZXR1cm4gcmM7CisJfQorCisJcmV0dXJuIDA7Cit9CisK
K3N0YXRpYyBpbnQga3ZtaV9zb2NrX3dyaXRlKHN0cnVjdCBrdm1pICppa3ZtLCBzdHJ1Y3Qga3Zl
YyAqaSwgc2l6ZV90IG4sCisJCQkgICBzaXplX3Qgc2l6ZSkKK3sKKwlzdHJ1Y3QgbXNnaGRyIG0g
PSB7IH07CisJaW50IHJjLCBrOworCisJcmMgPSBrZXJuZWxfc2VuZG1zZyhpa3ZtLT5zb2NrLCAm
bSwgaSwgbiwgc2l6ZSk7CisKKwlpZiAocmMgPiAwKQorCQlmb3IgKGsgPSAwOyBrIDwgbjsgaysr
KQorCQkJcHJpbnRfaGV4X2R1bXBfZGVidWcoIndyaXRlOiAiLCBEVU1QX1BSRUZJWF9OT05FLCAz
MiwgMSwKKwkJCQkJaVtrXS5pb3ZfYmFzZSwgaVtrXS5pb3ZfbGVuLCBmYWxzZSk7CisKKwlpZiAo
dW5saWtlbHkocmMgIT0gc2l6ZSkpIHsKKwkJa3ZtaV9lcnIoaWt2bSwgImtlcm5lbF9zZW5kbXNn
OiAlZFxuIiwgcmMpOworCQlpZiAocmMgPj0gMCkKKwkJCXJjID0gLUVQSVBFOworCQlyZXR1cm4g
cmM7CisJfQorCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQga3ZtaV9tc2dfcmVwbHkoc3Ry
dWN0IGt2bWkgKmlrdm0sCisJCQkgIGNvbnN0IHN0cnVjdCBrdm1pX21zZ19oZHIgKm1zZywgaW50
IGVyciwKKwkJCSAgY29uc3Qgdm9pZCAqcnBsLCBzaXplX3QgcnBsX3NpemUpCit7CisJc3RydWN0
IGt2bWlfZXJyb3JfY29kZSBlYzsKKwlzdHJ1Y3Qga3ZtaV9tc2dfaGRyIGg7CisJc3RydWN0IGt2
ZWMgdmVjWzNdID0geworCQl7IC5pb3ZfYmFzZSA9ICZoLCAuaW92X2xlbiA9IHNpemVvZihoKSB9
LAorCQl7IC5pb3ZfYmFzZSA9ICZlYywgLmlvdl9sZW4gPSBzaXplb2YoZWMpIH0sCisJCXsgLmlv
dl9iYXNlID0gKHZvaWQgKilycGwsIC5pb3ZfbGVuID0gcnBsX3NpemUgfSwKKwl9OworCXNpemVf
dCBzaXplID0gc2l6ZW9mKGgpICsgc2l6ZW9mKGVjKSArIChlcnIgPyAwIDogcnBsX3NpemUpOwor
CXNpemVfdCBuID0gZXJyID8gQVJSQVlfU0laRSh2ZWMpIC0gMSA6IEFSUkFZX1NJWkUodmVjKTsK
KworCW1lbXNldCgmaCwgMCwgc2l6ZW9mKGgpKTsKKwloLmlkID0gbXNnLT5pZDsKKwloLnNlcSA9
IG1zZy0+c2VxOworCWguc2l6ZSA9IHNpemUgLSBzaXplb2YoaCk7CisKKwltZW1zZXQoJmVjLCAw
LCBzaXplb2YoZWMpKTsKKwllYy5lcnIgPSBlcnI7CisKKwlyZXR1cm4ga3ZtaV9zb2NrX3dyaXRl
KGlrdm0sIHZlYywgbiwgc2l6ZSk7Cit9CisKK3N0YXRpYyBpbnQga3ZtaV9tc2dfdm1fcmVwbHko
c3RydWN0IGt2bWkgKmlrdm0sCisJCQkgICAgIGNvbnN0IHN0cnVjdCBrdm1pX21zZ19oZHIgKm1z
ZywgaW50IGVyciwKKwkJCSAgICAgY29uc3Qgdm9pZCAqcnBsLCBzaXplX3QgcnBsX3NpemUpCit7
CisJcmV0dXJuIGt2bWlfbXNnX3JlcGx5KGlrdm0sIG1zZywgZXJyLCBycGwsIHJwbF9zaXplKTsK
K30KKworc3RhdGljIGJvb2wgaXNfY29tbWFuZF9hbGxvd2VkKHN0cnVjdCBrdm1pICppa3ZtLCBp
bnQgaWQpCit7CisJcmV0dXJuIHRlc3RfYml0KGlkLCBpa3ZtLT5jbWRfYWxsb3dfbWFzayk7Cit9
CisKKy8qCisgKiBUaGVzZSBjb21tYW5kcyBhcmUgZXhlY3V0ZWQgb24gdGhlIHJlY2VpdmluZyB0
aHJlYWQvd29ya2VyLgorICovCitzdGF0aWMgaW50KCpjb25zdCBtc2dfdm1bXSkoc3RydWN0IGt2
bWkgKiwgY29uc3Qgc3RydWN0IGt2bWlfbXNnX2hkciAqLAorCQkJICAgIGNvbnN0IHZvaWQgKikg
PSB7Cit9OworCitzdGF0aWMgYm9vbCBpc192bV9tZXNzYWdlKHUxNiBpZCkKK3sKKwlyZXR1cm4g
aWQgPCBBUlJBWV9TSVpFKG1zZ192bSkgJiYgISFtc2dfdm1baWRdOworfQorCitzdGF0aWMgYm9v
bCBpc191bnN1cHBvcnRlZF9tZXNzYWdlKHUxNiBpZCkKK3sKKwlib29sIHN1cHBvcnRlZDsKKwor
CXN1cHBvcnRlZCA9IGlzX2tub3duX21lc3NhZ2UoaWQpICYmIGlzX3ZtX21lc3NhZ2UoaWQpOwor
CisJcmV0dXJuICFzdXBwb3J0ZWQ7Cit9CisKK3N0YXRpYyBpbnQga3ZtaV9jb25zdW1lX2J5dGVz
KHN0cnVjdCBrdm1pICppa3ZtLCBzaXplX3QgYnl0ZXMpCit7CisJc2l6ZV90IHRvX3JlYWQ7CisJ
dTggYnVmWzEwMjRdOworCWludCBlcnIgPSAwOworCisJd2hpbGUgKGJ5dGVzICYmICFlcnIpIHsK
KwkJdG9fcmVhZCA9IG1pbihieXRlcywgc2l6ZW9mKGJ1ZikpOworCisJCWVyciA9IGt2bWlfc29j
a19yZWFkKGlrdm0sIGJ1ZiwgdG9fcmVhZCk7CisKKwkJYnl0ZXMgLT0gdG9fcmVhZDsKKwl9CisK
KwlyZXR1cm4gZXJyOworfQorCitzdGF0aWMgc3RydWN0IGt2bWlfbXNnX2hkciAqa3ZtaV9tc2df
cmVjdihzdHJ1Y3Qga3ZtaSAqaWt2bSwgYm9vbCAqdW5zdXBwb3J0ZWQpCit7CisJc3RydWN0IGt2
bWlfbXNnX2hkciAqbXNnOworCWludCBlcnI7CisKKwkqdW5zdXBwb3J0ZWQgPSBmYWxzZTsKKwor
CW1zZyA9IGt2bWlfbXNnX2FsbG9jKCk7CisJaWYgKCFtc2cpCisJCWdvdG8gb3V0X2VycjsKKwor
CWVyciA9IGt2bWlfc29ja19yZWFkKGlrdm0sIG1zZywgc2l6ZW9mKCptc2cpKTsKKwlpZiAoZXJy
KQorCQlnb3RvIG91dF9lcnI7CisKKwlpZiAobXNnLT5zaXplID4gS1ZNSV9NU0dfU0laRSkKKwkJ
Z290byBvdXRfZXJyX21zZzsKKworCWlmIChpc191bnN1cHBvcnRlZF9tZXNzYWdlKG1zZy0+aWQp
KSB7CisJCWlmIChtc2ctPnNpemUgJiYga3ZtaV9jb25zdW1lX2J5dGVzKGlrdm0sIG1zZy0+c2l6
ZSkgPCAwKQorCQkJZ290byBvdXRfZXJyX21zZzsKKworCQkqdW5zdXBwb3J0ZWQgPSB0cnVlOwor
CQlyZXR1cm4gbXNnOworCX0KKworCWlmIChtc2ctPnNpemUgJiYga3ZtaV9zb2NrX3JlYWQoaWt2
bSwgbXNnICsgMSwgbXNnLT5zaXplKSA8IDApCisJCWdvdG8gb3V0X2Vycl9tc2c7CisKKwlyZXR1
cm4gbXNnOworCitvdXRfZXJyX21zZzoKKwlrdm1pX2Vycihpa3ZtLCAiJXMgaWQgJXUgKCVzKSBz
aXplICV1XG4iLAorCQkgX19mdW5jX18sIG1zZy0+aWQsIGlkMnN0cihtc2ctPmlkKSwgbXNnLT5z
aXplKTsKKworb3V0X2VycjoKKwlrdm1pX21zZ19mcmVlKG1zZyk7CisKKwlyZXR1cm4gTlVMTDsK
K30KKworc3RhdGljIGludCBrdm1pX21zZ19kaXNwYXRjaF92bV9jbWQoc3RydWN0IGt2bWkgKmlr
dm0sCisJCQkJICAgIGNvbnN0IHN0cnVjdCBrdm1pX21zZ19oZHIgKm1zZykKK3sKKwlyZXR1cm4g
bXNnX3ZtW21zZy0+aWRdKGlrdm0sIG1zZywgbXNnICsgMSk7Cit9CisKK3N0YXRpYyBpbnQga3Zt
aV9tc2dfZGlzcGF0Y2goc3RydWN0IGt2bWkgKmlrdm0sCisJCQkgICAgIHN0cnVjdCBrdm1pX21z
Z19oZHIgKm1zZywgYm9vbCAqcXVldWVkKQoreworCWludCBlcnI7CisKKwllcnIgPSBrdm1pX21z
Z19kaXNwYXRjaF92bV9jbWQoaWt2bSwgbXNnKTsKKworCWlmIChlcnIpCisJCWt2bWlfZXJyKGlr
dm0sICIlczogbXNnIGlkOiAldSAoJXMpLCBlcnI6ICVkXG4iLCBfX2Z1bmNfXywKKwkJCSBtc2ct
PmlkLCBpZDJzdHIobXNnLT5pZCksIGVycik7CisKKwlyZXR1cm4gZXJyOworfQorCitzdGF0aWMg
Ym9vbCBpc19tZXNzYWdlX2FsbG93ZWQoc3RydWN0IGt2bWkgKmlrdm0sIF9fdTE2IGlkKQorewor
CWlmIChpZCA9PSBLVk1JX0VWRU5UX1JFUExZKQorCQlyZXR1cm4gdHJ1ZTsKKworCS8qCisJICog
U29tZSBjb21tYW5kcyAoZWcucGF1c2UpIHJlcXVlc3QgZXZlbnRzIHRoYXQgbWlnaHQgYmUKKwkg
KiBkaXNhbGxvd2VkLiBUaGUgY29tbWFuZCBpcyBhbGxvd2VkIGhlcmUsIGJ1dCB0aGUgZnVuY3Rp
b24KKwkgKiBoYW5kbGluZyB0aGUgY29tbWFuZCB3aWxsIHJldHVybiAtS1ZNX0VQRVJNIGlmIHRo
ZSBldmVudAorCSAqIGlzIGRpc2FsbG93ZWQuCisJICovCisJcmV0dXJuIGlzX2NvbW1hbmRfYWxs
b3dlZChpa3ZtLCBpZCk7Cit9CisKIGJvb2wga3ZtaV9tc2dfcHJvY2VzcyhzdHJ1Y3Qga3ZtaSAq
aWt2bSkKIHsKLQlrdm1pX2luZm8oaWt2bSwgIlRPRE86ICVzIiwgX19mdW5jX18pOwotCXJldHVy
biBmYWxzZTsKKwlzdHJ1Y3Qga3ZtaV9tc2dfaGRyICptc2c7CisJYm9vbCBxdWV1ZWQgPSBmYWxz
ZTsKKwlib29sIHVuc3VwcG9ydGVkOworCWludCBlcnIgPSAtMTsKKworCW1zZyA9IGt2bWlfbXNn
X3JlY3YoaWt2bSwgJnVuc3VwcG9ydGVkKTsKKwlpZiAoIW1zZykKKwkJZ290byBvdXQ7CisKKwlp
ZiAodW5zdXBwb3J0ZWQpIHsKKwkJZXJyID0ga3ZtaV9tc2dfdm1fcmVwbHkoaWt2bSwgbXNnLCAt
S1ZNX0VPUE5PVFNVUFAsIE5VTEwsIDApOworCQlnb3RvIG91dDsKKwl9CisKKwlpZiAoIWlzX21l
c3NhZ2VfYWxsb3dlZChpa3ZtLCBtc2ctPmlkKSkgeworCQllcnIgPSBrdm1pX21zZ192bV9yZXBs
eShpa3ZtLCBtc2csIC1LVk1fRVBFUk0sIE5VTEwsIDApOworCQlnb3RvIG91dDsKKwl9CisKKwll
cnIgPSBrdm1pX21zZ19kaXNwYXRjaChpa3ZtLCBtc2csICZxdWV1ZWQpOworCitvdXQ6CisJaWYg
KCFxdWV1ZWQpCisJCWt2bWlfbXNnX2ZyZWUobXNnKTsKKworCXJldHVybiBlcnIgPT0gMDsKIH0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
