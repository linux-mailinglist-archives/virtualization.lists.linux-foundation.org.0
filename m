Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7226D2D1AC5
	for <lists.virtualization@lfdr.de>; Mon,  7 Dec 2020 21:46:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 22D6887986;
	Mon,  7 Dec 2020 20:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cAcjJRZvDx0B; Mon,  7 Dec 2020 20:46:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 883F88790A;
	Mon,  7 Dec 2020 20:46:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64DC8C013B;
	Mon,  7 Dec 2020 20:46:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27548C013B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1464887899
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yYnzk8XdQkO0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B2A4B87895
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:13 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 D92AF30462D3; Mon,  7 Dec 2020 22:46:11 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 6C0163072784;
 Mon,  7 Dec 2020 22:46:11 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v11 00/81] VM introspection
Date: Mon,  7 Dec 2020 22:45:01 +0200
Message-Id: <20201207204622.15258-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wanpeng Li <wanpengli@tencent.com>,
 Yu C Zhang <yu.c.zhang@intel.com>, Edwin Zhai <edwin.zhai@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 =?UTF-8?q?Samuel=20Laur=C3=A9n?= <samuel.lauren@iki.fi>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Weijiang Yang <weijiang.yang@intel.com>,
 Patrick Colp <patrick.colp@oracle.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>,
 Jim Mattson <jmattson@google.com>
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

VGhlcmUgYXJlIG5vIG1ham9yIGNoYW5nZXMgZnJvbSB0aGUgcHJldmlvdXMgdmVyc2lvbiAodjEw
KSwgZXhjZXB0IG9uCnBhdGNoIDQ5LCB0byBhdm9pZCBhIHBvc3NpYmxlIGNhc2Ugb2Ygc3RhY2sg
Y29ycnVwdGlvbi4KCkNoYW5nZXMgc2luY2UgdjEwIChodHRwczovL2xvcmUua2VybmVsLm9yZy9r
dm0vMjAyMDExMjUwOTM2MDAuMjc2Ni0xLWFsYXphckBiaXRkZWZlbmRlci5jb20vKToKICAtIGZp
eCB0aGUgZXZlbnQgcmVwbHkgdmFsaWRhdGlvbgogIC0gZml4IHRoZSBjb21waWxlLXRpbWUgd2Fy
bmluZ3MgcmVwb3J0ZWQgYnkgImtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPiIKICAt
IHNlbmQgdGhlIGVycm9yIGNvZGUgKEtWTV9FTk9NRU0pIHdoZW4gdGhlIG1lbW9yeSBhbGxvY2F0
aW9uIGZhaWxzCiAgICB3aGlsZSBoYW5kbGluZyB0aGUgS1ZNSV9WQ1BVX0dFVF9YU0FWRSBjb21t
YW5kCgpBZGFsYmVydCBMYXrEg3IgKDI0KToKICBLVk06IFVBUEk6IGFkZCBlcnJvciBjb2RlcyB1
c2VkIGJ5IHRoZSBWTSBpbnRyb3NwZWN0aW9uIGNvZGUKICBLVk06IGFkZCBrdm1fdmNwdV9raWNr
X2FuZF93YWl0KCkKICBLVk06IGRvYzogZml4IHRoZSBoeXBlcmNhbGxzIG51bWJlcmluZwogIEtW
TTogeDg2OiBhZGQga3ZtX3g4Nl9vcHMuY29udHJvbF9jcjNfaW50ZXJjZXB0KCkKICBLVk06IHg4
NjogYWRkIGt2bV94ODZfb3BzLmRlc2NfY3RybF9zdXBwb3J0ZWQoKQogIEtWTTogeDg2OiBhZGQg
a3ZtX3g4Nl9vcHMuY29udHJvbF9kZXNjX2ludGVyY2VwdCgpCiAgS1ZNOiB4ODY6IGV4cG9ydCBr
dm1fdmNwdV9pb2N0bF94ODZfc2V0X3hzYXZlKCkKICBLVk06IGludHJvc3BlY3Rpb246IGFkZCBo
b29rL3VuaG9vayBpb2N0bHMKICBLVk06IGludHJvc3BlY3Rpb246IGFkZCBwZXJtaXNzaW9uIGFj
Y2VzcyBpb2N0bHMKICBLVk06IGludHJvc3BlY3Rpb246IGFkZCB0aGUgcmVhZC9kaXNwYXRjaCBt
ZXNzYWdlIGZ1bmN0aW9uCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZNSV9HRVRfVkVSU0lP
TgogIEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtWTUlfVk1fQ0hFQ0tfQ09NTUFORCBhbmQgS1ZN
SV9WTV9DSEVDS19FVkVOVAogIEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtWTV9JTlRST1NQRUNU
SU9OX1BSRVVOSE9PSwogIEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtWTUlfVk1fRVZFTlRfVU5I
T09LCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZNSV9WTV9DT05UUk9MX0VWRU5UUwogIEtW
TTogaW50cm9zcGVjdGlvbjogYWRkIGEgam9icyBsaXN0IHRvIGV2ZXJ5IGludHJvc3BlY3RlZCB2
Q1BVCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZNSV9WTV9QQVVTRV9WQ1BVCiAgS1ZNOiBp
bnRyb3NwZWN0aW9uOiBhZGQgc3VwcG9ydCBmb3IgdkNQVSBldmVudHMKICBLVk06IGludHJvc3Bl
Y3Rpb246IGFkZCBLVk1JX1ZDUFVfRVZFTlRfUEFVU0UKICBLVk06IGludHJvc3BlY3Rpb246IGFk
ZCBLVk1JX1ZNX0NPTlRST0xfQ0xFQU5VUAogIEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtWTUlf
VkNQVV9HRVRfWENSCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZNSV9WQ1BVX1NFVF9YU0FW
RQogIEtWTTogaW50cm9zcGVjdGlvbjogZXh0ZW5kIEtWTUlfR0VUX1ZFUlNJT04gd2l0aCBzdHJ1
Y3Qga3ZtaV9mZWF0dXJlcwogIEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtWTUlfVkNQVV9UUkFO
U0xBVEVfR1ZBCgpNYXJpYW4gUm90YXJpdSAoMSk6CiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQg
S1ZNSV9WQ1BVX0dFVF9DUFVJRAoKTWloYWkgRG9uyJt1ICgzMyk6CiAgS1ZNOiB4ODY6IGFkZCBr
dm1fYXJjaF92Y3B1X2dldF9yZWdzKCkgYW5kIGt2bV9hcmNoX3ZjcHVfZ2V0X3NyZWdzKCkKICBL
Vk06IHg4NjogYXZvaWQgaW5qZWN0aW5nICNQRiB3aGVuIGVtdWxhdGUgdGhlIFZNQ0FMTCBpbnN0
cnVjdGlvbgogIEtWTTogeDg2OiBhZGQga3ZtX3g4Nl9vcHMuY29udHJvbF9tc3JfaW50ZXJjZXB0
KCkKICBLVk06IHg4Njogdm14OiB1c2UgYSBzeW1ib2xpYyBjb25zdGFudCB3aGVuIGNoZWNraW5n
IHRoZSBleGl0CiAgICBxdWFsaWZpY2F0aW9ucwogIEtWTTogeDg2OiBzYXZlIHRoZSBlcnJvciBj
b2RlIGR1cmluZyBFUFQvTlBGIGV4aXRzIGhhbmRsaW5nCiAgS1ZNOiB4ODY6IGFkZCBrdm1feDg2
X29wcy5mYXVsdF9nbGEoKQogIEtWTTogeDg2OiBleHRlbmQga3ZtX21tdV9ndmFfdG9fZ3BhX3N5
c3RlbSgpIHdpdGggdGhlICdhY2Nlc3MnCiAgICBwYXJhbWV0ZXIKICBLVk06IHg4NjogcGFnZSB0
cmFjazogcHJvdmlkZSBhbGwgY2FsbGJhY2tzIHdpdGggdGhlIGd1ZXN0IHZpcnR1YWwKICAgIGFk
ZHJlc3MKICBLVk06IHg4NjogcGFnZSB0cmFjazogYWRkIHRyYWNrX2NyZWF0ZV9zbG90KCkgY2Fs
bGJhY2sKICBLVk06IHg4NjogcGFnZV90cmFjazogYWRkIHN1cHBvcnQgZm9yIHByZXJlYWQsIHBy
ZXdyaXRlIGFuZCBwcmVleGVjCiAgS1ZNOiB4ODY6IHdpcmUgaW4gdGhlIHByZXJlYWQvcHJld3Jp
dGUvcHJlZXhlYyBwYWdlIHRyYWNrZXJzCiAgS1ZNOiBpbnRyb2R1Y2UgVk0gaW50cm9zcGVjdGlv
bgogIEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtWTUlfVk1fR0VUX0lORk8KICBLVk06IGludHJv
c3BlY3Rpb246IGFkZCBLVk1JX1ZNX1JFQURfUEhZU0lDQUwvS1ZNSV9WTV9XUklURV9QSFlTSUNB
TAogIEtWTTogaW50cm9zcGVjdGlvbjogaGFuZGxlIHZDUFUgaW50cm9zcGVjdGlvbiByZXF1ZXN0
cwogIEtWTTogaW50cm9zcGVjdGlvbjogaGFuZGxlIHZDUFUgY29tbWFuZHMKICBLVk06IGludHJv
c3BlY3Rpb246IGFkZCBLVk1JX1ZDUFVfR0VUX0lORk8KICBLVk06IGludHJvc3BlY3Rpb246IGFk
ZCB0aGUgY3Jhc2ggYWN0aW9uIGhhbmRsaW5nIG9uIHRoZSBldmVudCByZXBseQogIEtWTTogaW50
cm9zcGVjdGlvbjogYWRkIEtWTUlfVkNQVV9DT05UUk9MX0VWRU5UUwogIEtWTTogaW50cm9zcGVj
dGlvbjogYWRkIEtWTUlfVkNQVV9HRVRfUkVHSVNURVJTCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBh
ZGQgS1ZNSV9WQ1BVX1NFVF9SRUdJU1RFUlMKICBLVk06IGludHJvc3BlY3Rpb246IGFkZCBLVk1J
X1ZDUFVfRVZFTlRfSFlQRVJDQUxMCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZNSV9WQ1BV
X0VWRU5UX0JSRUFLUE9JTlQKICBLVk06IGludHJvc3BlY3Rpb246IGFkZCBLVk1JX1ZDUFVfQ09O
VFJPTF9DUiBhbmQgS1ZNSV9WQ1BVX0VWRU5UX0NSCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQg
S1ZNSV9WQ1BVX0lOSkVDVF9FWENFUFRJT04gKwogICAgS1ZNSV9WQ1BVX0VWRU5UX1RSQVAKICBL
Vk06IGludHJvc3BlY3Rpb246IGFkZCBLVk1JX1ZDUFVfRVZFTlRfWFNFVEJWCiAgS1ZNOiBpbnRy
b3NwZWN0aW9uOiBhZGQgS1ZNSV9WQ1BVX0dFVF9YU0FWRQogIEtWTTogaW50cm9zcGVjdGlvbjog
YWRkIEtWTUlfVkNQVV9HRVRfTVRSUl9UWVBFCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZN
SV9WQ1BVX0NPTlRST0xfTVNSIGFuZCBLVk1JX1ZDUFVfRVZFTlRfTVNSCiAgS1ZNOiBpbnRyb3Nw
ZWN0aW9uOiBhZGQgS1ZNSV9WTV9TRVRfUEFHRV9BQ0NFU1MKICBLVk06IGludHJvc3BlY3Rpb246
IGFkZCBLVk1JX1ZDUFVfRVZFTlRfUEYKICBLVk06IGludHJvc3BlY3Rpb246IGVtdWxhdGUgYSBn
dWVzdCBwYWdlIHRhYmxlIHdhbGsgb24gU1BUIHZpb2xhdGlvbnMKICAgIGR1ZSB0byBBL0QgYml0
IHVwZGF0ZXMKICBLVk06IHg4NjogY2FsbCB0aGUgcGFnZSB0cmFja2luZyBjb2RlIG9uIGVtdWxh
dGlvbiBmYWlsdXJlCgpNaXJjZWEgQ8OucmphbGl1ICgyKToKICBLVk06IHg4NjogZGlzYWJsZSBn
cGFfYXZhaWxhYmxlIG9wdGltaXphdGlvbiBmb3IgZmV0Y2ggYW5kIHBhZ2Utd2FsawogICAgU1BU
IHZpb2xhdGlvbnMKICBLVk06IGludHJvc3BlY3Rpb246IGFkZCB2Q1BVIHJlbGF0ZWQgZGF0YQoK
TmljdciZb3IgQ8OuyJt1ICgxOSk6CiAgS1ZNOiB4ODY6IGFkZCBrdm1fYXJjaF92Y3B1X3NldF9y
ZWdzKCkKICBLVk06IHg4NjogYWRkIGt2bV94ODZfb3BzLmJwX2ludGVyY2VwdGVkKCkKICBLVk06
IHg4NjogYWRkIGt2bV94ODZfb3BzLmNyM193cml0ZV9pbnRlcmNlcHRlZCgpCiAgS1ZNOiBzdm06
IGFkZCBzdXBwb3J0IGZvciBkZXNjcmlwdG9yLXRhYmxlIFZNLWV4aXRzCiAgS1ZNOiB4ODY6IGFk
ZCBrdm1feDg2X29wcy5kZXNjX2ludGVyY2VwdGVkKCkKICBLVk06IHg4NjogYWRkIGt2bV94ODZf
b3BzLm1zcl93cml0ZV9pbnRlcmNlcHRlZCgpCiAgS1ZNOiB4ODY6IHN2bTogdXNlIHRoZSB2bXgg
Y29udmVudGlvbiB0byBjb250cm9sIHRoZSBNU1IgaW50ZXJjZXB0aW9uCiAgS1ZNOiB4ODY6IGFk
ZCBrdm1feDg2X29wcy5jb250cm9sX3NpbmdsZXN0ZXAoKQogIEtWTTogeDg2OiBleHBvcnQga3Zt
X2FyY2hfdmNwdV9zZXRfZ3Vlc3RfZGVidWcoKQogIEtWTTogeDg2OiBleHBvcnQga3ZtX2luamVj
dF9wZW5kaW5nX2V4Y2VwdGlvbigpCiAgS1ZNOiB4ODY6IGV4cG9ydCBrdm1fdmNwdV9pb2N0bF94
ODZfZ2V0X3hzYXZlKCkKICBLVk06IGludHJvc3BlY3Rpb246IGFkZCBjbGVhbnVwIHN1cHBvcnQg
Zm9yIHZDUFVzCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiByZXN0b3JlIHRoZSBzdGF0ZSBvZiAjQlAg
aW50ZXJjZXB0aW9uIG9uIHVuaG9vawogIEtWTTogaW50cm9zcGVjdGlvbjogcmVzdG9yZSB0aGUg
c3RhdGUgb2YgQ1IzIGludGVyY2VwdGlvbiBvbiB1bmhvb2sKICBLVk06IGludHJvc3BlY3Rpb246
IGFkZCBLVk1JX1ZDUFVfRVZFTlRfREVTQ1JJUFRPUgogIEtWTTogaW50cm9zcGVjdGlvbjogcmVz
dG9yZSB0aGUgc3RhdGUgb2YgZGVzY3JpcHRvci10YWJsZSByZWdpc3RlcgogICAgaW50ZXJjZXB0
aW9uIG9uIHVuaG9vawogIEtWTTogaW50cm9zcGVjdGlvbjogcmVzdG9yZSB0aGUgc3RhdGUgb2Yg
TVNSIGludGVyY2VwdGlvbiBvbiB1bmhvb2sKICBLVk06IGludHJvc3BlY3Rpb246IGFkZCBLVk1J
X1ZDUFVfQ09OVFJPTF9TSU5HTEVTVEVQCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZNSV9W
Q1BVX0VWRU5UX1NJTkdMRVNURVAKCsiYdGVmYW4gyJhpY2xlcnUgKDIpOgogIEtWTTogYWRkIGt2
bV9nZXRfbWF4X2dmbigpCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZNSV9WTV9HRVRfTUFY
X0dGTgoKIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdCAgICAgICAgICAgICAgICB8ICAx
NTkgKysKIERvY3VtZW50YXRpb24vdmlydC9rdm0vaHlwZXJjYWxscy5yc3QgICAgICAgICB8ICAg
MzkgKy0KIERvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QgICAgICAgICAgICAgICB8IDE1
NzMgKysrKysrKysrKysrKwogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgICAgICAg
ICAgICAgIHwgICA0NiArLQogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX3BhZ2VfdHJhY2suaCAg
ICAgICAgIHwgICA3MSArLQogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtaV9ob3N0LmggICAgICAg
ICAgICAgIHwgIDExMCArCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS92bXguaCAgICAgICAgICAgICAg
ICAgICAgfCAgICAyICsKIGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oICAgICAgICAg
ICAgICB8ICAxNjcgKysKIGFyY2gveDg2L2t2bS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgIDkgKwogYXJjaC94ODYva3ZtL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAgMiArCiBhcmNoL3g4Ni9rdm0vZW11bGF0ZS5jICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgICA0ICsKIGFyY2gveDg2L2t2bS9rdm1fZW11bGF0ZS5oICAgICAgICAgICAgICAgICAg
ICB8ICAgIDEgKwogYXJjaC94ODYva3ZtL2t2bWkuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMTEzMSArKysrKysrKysrCiBhcmNoL3g4Ni9rdm0va3ZtaS5oICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDI0ICsKIGFyY2gveDg2L2t2bS9rdm1pX21zZy5jICAgICAgICAgICAgICAg
ICAgICAgICB8ICA0NTYgKysrKwogYXJjaC94ODYva3ZtL21tdS9tbXUuYyAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDE0MCArLQogYXJjaC94ODYva3ZtL21tdS9tbXVfaW50ZXJuYWwuaCAgICAg
ICAgICAgICAgIHwgICAgNCArCiBhcmNoL3g4Ni9rdm0vbW11L3BhZ2VfdHJhY2suYyAgICAgICAg
ICAgICAgICAgfCAgMTQ2ICstCiBhcmNoL3g4Ni9rdm0vbW11L3NwdGUuYyAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDE3ICsKIGFyY2gveDg2L2t2bS9zdm0vc3ZtLmMgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyODggKystCiBhcmNoL3g4Ni9rdm0vc3ZtL3N2bS5oICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgICA3ICsKIGFyY2gveDg2L2t2bS92bXgvY2FwYWJpbGl0aWVzLmggICAgICAg
ICAgICAgICB8ICAgIDcgKy0KIGFyY2gveDg2L2t2bS92bXgvdm14LmMgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAxNjggKy0KIGFyY2gveDg2L2t2bS92bXgvdm14LmggICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgIDQgLQogYXJjaC94ODYva3ZtL3g4Ni5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDMwMiArKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jICAgICAg
ICAgICAgICB8ICAgIDIgKy0KIGluY2x1ZGUvbGludXgva3ZtX2hvc3QuaCAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMTYgKwogaW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaCAgICAgICAgICAgICAg
ICAgICAgIHwgIDExMCArCiBpbmNsdWRlL3VhcGkvbGludXgva3ZtLmggICAgICAgICAgICAgICAg
ICAgICAgfCAgIDIwICsKIGluY2x1ZGUvdWFwaS9saW51eC9rdm1fcGFyYS5oICAgICAgICAgICAg
ICAgICB8ICAgIDUgKwogaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCAgICAgICAgICAgICAgICAg
ICAgIHwgIDI0NSArKwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL01ha2VmaWxlICAgICAg
ICAgIHwgICAgMSArCiAuLi4vdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3Qu
YyAgfCAyMDA1ICsrKysrKysrKysrKysrKysrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWku
YyAgICAgICAgICAgICAgICAgfCAxMjY0ICsrKysrKysrKysrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0
aW9uL2t2bWlfaW50LmggICAgICAgICAgICAgfCAgMTI5ICsrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0
aW9uL2t2bWlfbXNnLmMgICAgICAgICAgICAgfCAgOTE1ICsrKysrKysrCiB2aXJ0L2t2bS9rdm1f
bWFpbi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDk4ICsKIDM3IGZpbGVzIGNoYW5n
ZWQsIDk1MjUgaW5zZXJ0aW9ucygrKSwgMTYyIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
cmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
eDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC94ODYv
a3ZtL2t2bWkuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gveDg2L2t2bS9rdm1pLmgKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL3g4Ni9rdm0va3ZtaV9tc2cuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvbGludXgva3ZtaV9ob3N0LmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3Vh
cGkvbGludXgva3ZtaS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHZpcnQva3ZtL2lu
dHJvc3BlY3Rpb24va3ZtaS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgdmlydC9rdm0vaW50cm9zcGVj
dGlvbi9rdm1pX2ludC5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgdmlydC9rdm0vaW50cm9zcGVjdGlv
bi9rdm1pX21zZy5jCgoKYmFzZS1jb21taXQ6IGRjOTI0YjA2MjQ4OGEwMzc2YWFlNDFkM2UwYTI3
ZGM5OWY4NTJhNWUKQ0M6IEVkd2luIFpoYWkgPGVkd2luLnpoYWlAaW50ZWwuY29tPgpDQzogSmFu
IEtpc3prYSA8amFuLmtpc3prYUBzaWVtZW5zLmNvbT4KQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2ls
ayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ0M6IE1hdGhpZXUgVGFycmFsIDxtYXRoaWV1LnRh
cnJhbEBwcm90b25tYWlsLmNvbT4KQ0M6IFBhdHJpY2sgQ29scCA8cGF0cmljay5jb2xwQG9yYWNs
ZS5jb20+CkNDOiBTYW11ZWwgTGF1csOpbiA8c2FtdWVsLmxhdXJlbkBpa2kuZmk+CkNDOiBTdGVm
YW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+CkNDOiBUYW1hcyBLIExlbmd5ZWwgPHRh
bWFzQHRrbGVuZ3llbC5jb20+CkNDOiBXZWlqaWFuZyBZYW5nIDx3ZWlqaWFuZy55YW5nQGludGVs
LmNvbT4KQ0M6IFl1IEMgWmhhbmcgPHl1LmMuemhhbmdAaW50ZWwuY29tPgpDQzogU2VhbiBDaHJp
c3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+CkNDOiBKb2VyZyBSb2VkZWwgPGpvcm9AOGJ5
dGVzLm9yZz4KQ0M6IFZpdGFseSBLdXpuZXRzb3YgPHZrdXpuZXRzQHJlZGhhdC5jb20+CkNDOiBX
YW5wZW5nIExpIDx3YW5wZW5nbGlAdGVuY2VudC5jb20+CkNDOiBKaW0gTWF0dHNvbiA8am1hdHRz
b25AZ29vZ2xlLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
