Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 722612C3D00
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 10:52:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 130AD86BC4;
	Wed, 25 Nov 2020 09:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SckE5Af2hCqS; Wed, 25 Nov 2020 09:52:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 23F7986BB2;
	Wed, 25 Nov 2020 09:52:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09BDEC163C;
	Wed, 25 Nov 2020 09:52:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 428B0C163C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2358886B45
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:52:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VsSPgB5lGTIk
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:52:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A861786A99
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:51:58 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 4AC9B30462CC; Wed, 25 Nov 2020 11:35:43 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id CA7393072784;
 Wed, 25 Nov 2020 11:35:42 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v10 00/81] VM introspection
Date: Wed, 25 Nov 2020 11:34:39 +0200
Message-Id: <20201125093600.2766-1-alazar@bitdefender.com>
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

VGhlIEtWTSBpbnRyb3NwZWN0aW9uIHN1YnN5c3RlbSBwcm92aWRlcyBhIGZhY2lsaXR5IGZvciBh
cHBsaWNhdGlvbnMKcnVubmluZyBvbiB0aGUgaG9zdCBvciBpbiBhIHNlcGFyYXRlIFZNLCB0byBj
b250cm9sIHRoZSBleGVjdXRpb24gb2YKb3RoZXIgVk1zIChwYXVzZSwgcmVzdW1lLCBzaHV0ZG93
biksIHF1ZXJ5IHRoZSBzdGF0ZSBvZiB0aGUgdkNQVXMgKEdQUnMsCk1TUnMgZXRjLiksIGFsdGVy
IHRoZSBwYWdlIGFjY2VzcyBiaXRzIGluIHRoZSBzaGFkb3cgcGFnZSB0YWJsZXMgKG9ubHkKZm9y
IHRoZSBoYXJkd2FyZSBiYWNrZWQgb25lcywgZWcuIEludGVsJ3MgRVBUKSBhbmQgcmVjZWl2ZSBu
b3RpZmljYXRpb25zCndoZW4gZXZlbnRzIG9mIGludGVyZXN0IGhhdmUgdGFrZW4gcGxhY2UgKHNo
YWRvdyBwYWdlIHRhYmxlIGxldmVsIGZhdWx0cywKa2V5IE1TUiB3cml0ZXMsIGh5cGVyY2FsbHMg
ZXRjLikuIFNvbWUgbm90aWZpY2F0aW9ucyBjYW4gYmUgcmVzcG9uZGVkCnRvIHdpdGggYW4gYWN0
aW9uIChsaWtlIHByZXZlbnRpbmcgYW4gTVNSIGZyb20gYmVpbmcgd3JpdHRlbiksIG90aGVycwph
cmUgbWVyZSBpbmZvcm1hdGl2ZSAobGlrZSBicmVha3BvaW50IGV2ZW50cyB3aGljaCBjYW4gYmUg
dXNlZCBmb3IKZXhlY3V0aW9uIHRyYWNpbmcpLiAgV2l0aCBmZXcgZXhjZXB0aW9ucywgYWxsIGV2
ZW50cyBhcmUgb3B0aW9uYWwuIEFuCmFwcGxpY2F0aW9uIHVzaW5nIHRoaXMgc3Vic3lzdGVtIHdp
bGwgZXhwbGljaXRseSByZWdpc3RlciBmb3IgdGhlbS4KClRoZSB1c2UgY2FzZSB0aGF0IGdhdmUg
d2F5IGZvciB0aGUgY3JlYXRpb24gb2YgdGhpcyBzdWJzeXN0ZW0gaXMgdG8KbW9uaXRvciB0aGUg
Z3Vlc3QgT1MgYW5kIGFzIHN1Y2ggdGhlIEFCSS9BUEkgaXMgaGlnaGx5IGluZmx1ZW5jZWQgYnkg
aG93CnRoZSBndWVzdCBzb2Z0d2FyZSAoa2VybmVsLCBhcHBsaWNhdGlvbnMpIHNlZXMgdGhlIHdv
cmxkLiBGb3IgZXhhbXBsZSwKc29tZSBldmVudHMgcHJvdmlkZSBpbmZvcm1hdGlvbiBzcGVjaWZp
YyBmb3IgdGhlIGhvc3QgQ1BVIGFyY2hpdGVjdHVyZQooZWcuIE1TUl9JQTMyX1NZU0VOVEVSX0VJ
UCkgbWVyZWx5IGJlY2F1c2UgaXRzIGxldmVyYWdlZCBieSBndWVzdCBzb2Z0d2FyZQp0byBpbXBs
ZW1lbnQgYSBjcml0aWNhbCBmZWF0dXJlIChmYXN0IHN5c3RlbSBjYWxscykuCgpBdCB0aGUgbW9t
ZW50LCB0aGUgdGFyZ2V0IGF1ZGllbmNlIGZvciBLVk1JIGFyZSBzZWN1cml0eSBzb2Z0d2FyZSBh
dXRob3JzCnRoYXQgd2lzaCB0byBwZXJmb3JtIGZvcmVuc2ljcyBvbiBuZXdseSBkaXNjb3ZlcmVk
IHRocmVhdHMgKGV4cGxvaXRzKQpvciB0byBpbXBsZW1lbnQgYW5vdGhlciBsYXllciBvZiBzZWN1
cml0eSBsaWtlIHByZXZlbnRpbmcgYSBsYXJnZSBzZXQKb2Yga2VybmVsIHJvb3RraXRzIHNpbXBs
eSBieSAibG9ja2luZyIgdGhlIGtlcm5lbCBpbWFnZSBpbiB0aGUgc2hhZG93CnBhZ2UgdGFibGVz
IChpZS4gZW5mb3JjZSAudGV4dCByLXgsIC5yb2RhdGEgcnctIGV0Yy4pLiBJdCdzIHRoZSBsYXR0
ZXIKY2FzZSB0aGF0IG1hZGUgS1ZNSSBhIHNlcGFyYXRlIHN1YnN5c3RlbSwgZXZlbiB0aG91Z2gg
bWFueSBvZiB0aGVzZQpmZWF0dXJlcyBhcmUgYXZhaWxhYmxlIGluIHRoZSBkZXZpY2UgbWFuYWdl
ci4gVGhlIGFiaWxpdHkgdG8gYnVpbGQgYQpzZWN1cml0eSBhcHBsaWNhdGlvbiB0aGF0IGRvZXMg
bm90IGludGVyZmVyZSAoaW4gdGVybXMgb2YgcGVyZm9ybWFuY2UpCndpdGggdGhlIGd1ZXN0IHNv
ZnR3YXJlIGFza3MgZm9yIGEgc3BlY2lhbGl6ZWQgaW50ZXJmYWNlIHRoYXQgaXMgZGVzaWduZWQK
Zm9yIG1pbmltdW0gb3ZlcmhlYWQuCgpUaGlzIHBhdGNoIHNlcmllcyBpcyBiYXNlZCBvbiBrdm0v
bmV4dCwKY29tbWl0IGRjOTI0YjA2MjQ4OCAoIktWTTogU1ZNOiBjaGVjayBDUjQgY2hhbmdlcyBh
Z2FpbnN0IHZjcHUtPmFyY2giKS4KClRoZSBwcmV2aW91cyB2ZXJzaW9uICh2OSkgY2FuIGJlIHJl
YWQgaGVyZToKCiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcva3ZtLzIwMjAwNzIxMjEwOTIyLjc2
NDYtMS1hbGF6YXJAYml0ZGVmZW5kZXIuY29tLwoKUGF0Y2hlcyAxLTMxOiBtYWtlIHByZXBhcmF0
b3J5IGNoYW5nZXMKClBhdGNoZXMgMzItNzk6IGFkZCBiYXNpYyBpbnRyb3NwZWN0aW9uIGNhcGFi
aWxpdGllcwoKUGF0Y2ggODA6IHN1cHBvcnQgaW50cm9zcGVjdGlvbiB0b29scyB0aGF0IHdyaXRl
LXByb3RlY3QgZ3Vlc3QgcGFnZSB0YWJsZXMKClBhdGNoIDgxOiBub3RpZnkgdGhlIGludHJvc3Bl
Y3Rpb24gdG9vbCBldmVuIG9uIGVtdWxhdGlvbiBmYWlsdXJlcwogICAgICAgICAgKHdoZW4gdGhl
IHJlYWQvd3JpdGUgY2FsbGJhY2tzIHVzZWQgYnkgdGhlIGVtdWxhdG9yLAogICAgICAgICAgIGt2
bV9wYWdlX3ByZXJlYWQva3ZtX3BhZ2VfcHJld3JpdGUsIGFyZSBub3QgaW52b2tlZCkKCkNoYW5n
ZXMgc2luY2Ugdjk6CiAgLSByZWJhc2Ugb24gNS4xMCBmcm9tIDUuOAogIC0gY29tcGxldGUgdGhl
IHNwbGl0IG9mIHg4NiBhbmQgYXJjaC1pbmRlcGVuZGVudCBjb2RlCiAgLSBzcGxpdCB0aGUgVk0g
YW5kIHZDUFUgZXZlbnRzCiAgLSBjbGVhbiB1cCB0aGUgaW50ZXJmYWNlIGhlYWRlcnMgKFZNIHZz
IHZDUFUgbWVzc2FnZXMvZXZlbnRzKQogIC0gY2xlYW4gdXAgdGhlIHRlc3RzCiAgLSBhZGQgYSBu
ZXcgZXhpdCBjb2RlIChmb3IgdGhlIENSQVNIIGFjdGlvbikgaW5zdGVhZCBvZiBraWxsaW5nCiAg
ICB0aGUgdkNQVSB0aHJlYWRzIFtDaHJpc3RvcGhdCiAgLSBvdGhlciBzbWFsbCBjaGFuZ2VzIChj
b2RlIHJlZmFjdG9yaW5nLCBtZXNzYWdlIHZhbGlkYXRpb24sIGV0Yy4pLgoKQWRhbGJlcnQgTGF6
xINyICgyNCk6CiAgS1ZNOiBVQVBJOiBhZGQgZXJyb3IgY29kZXMgdXNlZCBieSB0aGUgVk0gaW50
cm9zcGVjdGlvbiBjb2RlCiAgS1ZNOiBhZGQga3ZtX3ZjcHVfa2lja19hbmRfd2FpdCgpCiAgS1ZN
OiBkb2M6IGZpeCB0aGUgaHlwZXJjYWxscyBudW1iZXJpbmcKICBLVk06IHg4NjogYWRkIGt2bV94
ODZfb3BzLmNvbnRyb2xfY3IzX2ludGVyY2VwdCgpCiAgS1ZNOiB4ODY6IGFkZCBrdm1feDg2X29w
cy5kZXNjX2N0cmxfc3VwcG9ydGVkKCkKICBLVk06IHg4NjogYWRkIGt2bV94ODZfb3BzLmNvbnRy
b2xfZGVzY19pbnRlcmNlcHQoKQogIEtWTTogeDg2OiBleHBvcnQga3ZtX3ZjcHVfaW9jdGxfeDg2
X3NldF94c2F2ZSgpCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgaG9vay91bmhvb2sgaW9jdGxz
CiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgcGVybWlzc2lvbiBhY2Nlc3MgaW9jdGxzCiAgS1ZN
OiBpbnRyb3NwZWN0aW9uOiBhZGQgdGhlIHJlYWQvZGlzcGF0Y2ggbWVzc2FnZSBmdW5jdGlvbgog
IEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtWTUlfR0VUX1ZFUlNJT04KICBLVk06IGludHJvc3Bl
Y3Rpb246IGFkZCBLVk1JX1ZNX0NIRUNLX0NPTU1BTkQgYW5kIEtWTUlfVk1fQ0hFQ0tfRVZFTlQK
ICBLVk06IGludHJvc3BlY3Rpb246IGFkZCBLVk1fSU5UUk9TUEVDVElPTl9QUkVVTkhPT0sKICBL
Vk06IGludHJvc3BlY3Rpb246IGFkZCBLVk1JX1ZNX0VWRU5UX1VOSE9PSwogIEtWTTogaW50cm9z
cGVjdGlvbjogYWRkIEtWTUlfVk1fQ09OVFJPTF9FVkVOVFMKICBLVk06IGludHJvc3BlY3Rpb246
IGFkZCBhIGpvYnMgbGlzdCB0byBldmVyeSBpbnRyb3NwZWN0ZWQgdkNQVQogIEtWTTogaW50cm9z
cGVjdGlvbjogYWRkIEtWTUlfVk1fUEFVU0VfVkNQVQogIEtWTTogaW50cm9zcGVjdGlvbjogYWRk
IHN1cHBvcnQgZm9yIHZDUFUgZXZlbnRzCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZNSV9W
Q1BVX0VWRU5UX1BBVVNFCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZNSV9WTV9DT05UUk9M
X0NMRUFOVVAKICBLVk06IGludHJvc3BlY3Rpb246IGFkZCBLVk1JX1ZDUFVfR0VUX1hDUgogIEtW
TTogaW50cm9zcGVjdGlvbjogYWRkIEtWTUlfVkNQVV9TRVRfWFNBVkUKICBLVk06IGludHJvc3Bl
Y3Rpb246IGV4dGVuZCBLVk1JX0dFVF9WRVJTSU9OIHdpdGggc3RydWN0IGt2bWlfZmVhdHVyZXMK
ICBLVk06IGludHJvc3BlY3Rpb246IGFkZCBLVk1JX1ZDUFVfVFJBTlNMQVRFX0dWQQoKTWFyaWFu
IFJvdGFyaXUgKDEpOgogIEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtWTUlfVkNQVV9HRVRfQ1BV
SUQKCk1paGFpIERvbsibdSAoMzMpOgogIEtWTTogeDg2OiBhZGQga3ZtX2FyY2hfdmNwdV9nZXRf
cmVncygpIGFuZCBrdm1fYXJjaF92Y3B1X2dldF9zcmVncygpCiAgS1ZNOiB4ODY6IGF2b2lkIGlu
amVjdGluZyAjUEYgd2hlbiBlbXVsYXRlIHRoZSBWTUNBTEwgaW5zdHJ1Y3Rpb24KICBLVk06IHg4
NjogYWRkIGt2bV94ODZfb3BzLmNvbnRyb2xfbXNyX2ludGVyY2VwdCgpCiAgS1ZNOiB4ODY6IHZt
eDogdXNlIGEgc3ltYm9saWMgY29uc3RhbnQgd2hlbiBjaGVja2luZyB0aGUgZXhpdAogICAgcXVh
bGlmaWNhdGlvbnMKICBLVk06IHg4Njogc2F2ZSB0aGUgZXJyb3IgY29kZSBkdXJpbmcgRVBUL05Q
RiBleGl0cyBoYW5kbGluZwogIEtWTTogeDg2OiBhZGQga3ZtX3g4Nl9vcHMuZmF1bHRfZ2xhKCkK
ICBLVk06IHg4NjogZXh0ZW5kIGt2bV9tbXVfZ3ZhX3RvX2dwYV9zeXN0ZW0oKSB3aXRoIHRoZSAn
YWNjZXNzJwogICAgcGFyYW1ldGVyCiAgS1ZNOiB4ODY6IHBhZ2UgdHJhY2s6IHByb3ZpZGUgYWxs
IGNhbGxiYWNrcyB3aXRoIHRoZSBndWVzdCB2aXJ0dWFsCiAgICBhZGRyZXNzCiAgS1ZNOiB4ODY6
IHBhZ2UgdHJhY2s6IGFkZCB0cmFja19jcmVhdGVfc2xvdCgpIGNhbGxiYWNrCiAgS1ZNOiB4ODY6
IHBhZ2VfdHJhY2s6IGFkZCBzdXBwb3J0IGZvciBwcmVyZWFkLCBwcmV3cml0ZSBhbmQgcHJlZXhl
YwogIEtWTTogeDg2OiB3aXJlIGluIHRoZSBwcmVyZWFkL3ByZXdyaXRlL3ByZWV4ZWMgcGFnZSB0
cmFja2VycwogIEtWTTogaW50cm9kdWNlIFZNIGludHJvc3BlY3Rpb24KICBLVk06IGludHJvc3Bl
Y3Rpb246IGFkZCBLVk1JX1ZNX0dFVF9JTkZPCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZN
SV9WTV9SRUFEX1BIWVNJQ0FML0tWTUlfVk1fV1JJVEVfUEhZU0lDQUwKICBLVk06IGludHJvc3Bl
Y3Rpb246IGhhbmRsZSB2Q1BVIGludHJvc3BlY3Rpb24gcmVxdWVzdHMKICBLVk06IGludHJvc3Bl
Y3Rpb246IGhhbmRsZSB2Q1BVIGNvbW1hbmRzCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZN
SV9WQ1BVX0dFVF9JTkZPCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgdGhlIGNyYXNoIGFjdGlv
biBoYW5kbGluZyBvbiB0aGUgZXZlbnQgcmVwbHkKICBLVk06IGludHJvc3BlY3Rpb246IGFkZCBL
Vk1JX1ZDUFVfQ09OVFJPTF9FVkVOVFMKICBLVk06IGludHJvc3BlY3Rpb246IGFkZCBLVk1JX1ZD
UFVfR0VUX1JFR0lTVEVSUwogIEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtWTUlfVkNQVV9TRVRf
UkVHSVNURVJTCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZNSV9WQ1BVX0VWRU5UX0hZUEVS
Q0FMTAogIEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtWTUlfVkNQVV9FVkVOVF9CUkVBS1BPSU5U
CiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZNSV9WQ1BVX0NPTlRST0xfQ1IgYW5kIEtWTUlf
VkNQVV9FVkVOVF9DUgogIEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtWTUlfVkNQVV9JTkpFQ1Rf
RVhDRVBUSU9OICsKICAgIEtWTUlfVkNQVV9FVkVOVF9UUkFQCiAgS1ZNOiBpbnRyb3NwZWN0aW9u
OiBhZGQgS1ZNSV9WQ1BVX0VWRU5UX1hTRVRCVgogIEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtW
TUlfVkNQVV9HRVRfWFNBVkUKICBLVk06IGludHJvc3BlY3Rpb246IGFkZCBLVk1JX1ZDUFVfR0VU
X01UUlJfVFlQRQogIEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtWTUlfVkNQVV9DT05UUk9MX01T
UiBhbmQgS1ZNSV9WQ1BVX0VWRU5UX01TUgogIEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtWTUlf
Vk1fU0VUX1BBR0VfQUNDRVNTCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZNSV9WQ1BVX0VW
RU5UX1BGCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBlbXVsYXRlIGEgZ3Vlc3QgcGFnZSB0YWJsZSB3
YWxrIG9uIFNQVCB2aW9sYXRpb25zCiAgICBkdWUgdG8gQS9EIGJpdCB1cGRhdGVzCiAgS1ZNOiB4
ODY6IGNhbGwgdGhlIHBhZ2UgdHJhY2tpbmcgY29kZSBvbiBlbXVsYXRpb24gZmFpbHVyZQoKTWly
Y2VhIEPDrnJqYWxpdSAoMik6CiAgS1ZNOiB4ODY6IGRpc2FibGUgZ3BhX2F2YWlsYWJsZSBvcHRp
bWl6YXRpb24gZm9yIGZldGNoIGFuZCBwYWdlLXdhbGsKICAgIFNQVCB2aW9sYXRpb25zCiAgS1ZN
OiBpbnRyb3NwZWN0aW9uOiBhZGQgdkNQVSByZWxhdGVkIGRhdGEKCk5pY3XImW9yIEPDrsibdSAo
MTkpOgogIEtWTTogeDg2OiBhZGQga3ZtX2FyY2hfdmNwdV9zZXRfcmVncygpCiAgS1ZNOiB4ODY6
IGFkZCBrdm1feDg2X29wcy5icF9pbnRlcmNlcHRlZCgpCiAgS1ZNOiB4ODY6IGFkZCBrdm1feDg2
X29wcy5jcjNfd3JpdGVfaW50ZXJjZXB0ZWQoKQogIEtWTTogc3ZtOiBhZGQgc3VwcG9ydCBmb3Ig
ZGVzY3JpcHRvci10YWJsZSBWTS1leGl0cwogIEtWTTogeDg2OiBhZGQga3ZtX3g4Nl9vcHMuZGVz
Y19pbnRlcmNlcHRlZCgpCiAgS1ZNOiB4ODY6IGFkZCBrdm1feDg2X29wcy5tc3Jfd3JpdGVfaW50
ZXJjZXB0ZWQoKQogIEtWTTogeDg2OiBzdm06IHVzZSB0aGUgdm14IGNvbnZlbnRpb24gdG8gY29u
dHJvbCB0aGUgTVNSIGludGVyY2VwdGlvbgogIEtWTTogeDg2OiBhZGQga3ZtX3g4Nl9vcHMuY29u
dHJvbF9zaW5nbGVzdGVwKCkKICBLVk06IHg4NjogZXhwb3J0IGt2bV9hcmNoX3ZjcHVfc2V0X2d1
ZXN0X2RlYnVnKCkKICBLVk06IHg4NjogZXhwb3J0IGt2bV9pbmplY3RfcGVuZGluZ19leGNlcHRp
b24oKQogIEtWTTogeDg2OiBleHBvcnQga3ZtX3ZjcHVfaW9jdGxfeDg2X2dldF94c2F2ZSgpCiAg
S1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgY2xlYW51cCBzdXBwb3J0IGZvciB2Q1BVcwogIEtWTTog
aW50cm9zcGVjdGlvbjogcmVzdG9yZSB0aGUgc3RhdGUgb2YgI0JQIGludGVyY2VwdGlvbiBvbiB1
bmhvb2sKICBLVk06IGludHJvc3BlY3Rpb246IHJlc3RvcmUgdGhlIHN0YXRlIG9mIENSMyBpbnRl
cmNlcHRpb24gb24gdW5ob29rCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZNSV9WQ1BVX0VW
RU5UX0RFU0NSSVBUT1IKICBLVk06IGludHJvc3BlY3Rpb246IHJlc3RvcmUgdGhlIHN0YXRlIG9m
IGRlc2NyaXB0b3ItdGFibGUgcmVnaXN0ZXIKICAgIGludGVyY2VwdGlvbiBvbiB1bmhvb2sKICBL
Vk06IGludHJvc3BlY3Rpb246IHJlc3RvcmUgdGhlIHN0YXRlIG9mIE1TUiBpbnRlcmNlcHRpb24g
b24gdW5ob29rCiAgS1ZNOiBpbnRyb3NwZWN0aW9uOiBhZGQgS1ZNSV9WQ1BVX0NPTlRST0xfU0lO
R0xFU1RFUAogIEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtWTUlfVkNQVV9FVkVOVF9TSU5HTEVT
VEVQCgrImHRlZmFuIMiYaWNsZXJ1ICgyKToKICBLVk06IGFkZCBrdm1fZ2V0X21heF9nZm4oKQog
IEtWTTogaW50cm9zcGVjdGlvbjogYWRkIEtWTUlfVk1fR0VUX01BWF9HRk4KCiBEb2N1bWVudGF0
aW9uL3ZpcnQva3ZtL2FwaS5yc3QgICAgICAgICAgICAgICAgfCAgMTU5ICsrCiBEb2N1bWVudGF0
aW9uL3ZpcnQva3ZtL2h5cGVyY2FsbHMucnN0ICAgICAgICAgfCAgIDM5ICstCiBEb2N1bWVudGF0
aW9uL3ZpcnQva3ZtL2t2bWkucnN0ICAgICAgICAgICAgICAgfCAxNTczICsrKysrKysrKysrKysK
IGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggICAgICAgICAgICAgICB8ICAgNDEgKy0K
IGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9wYWdlX3RyYWNrLmggICAgICAgICB8ICAgNzEgKy0K
IGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oICAgICAgICAgICAgICB8ICAxMTAgKwog
YXJjaC94ODYvaW5jbHVkZS9hc20vdm14LmggICAgICAgICAgICAgICAgICAgIHwgICAgMiArCiBh
cmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bWkuaCAgICAgICAgICAgICAgfCAgMTY3ICsrCiBh
cmNoL3g4Ni9rdm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA5ICsKIGFy
Y2gveDg2L2t2bS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKwogYXJj
aC94ODYva3ZtL2VtdWxhdGUuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNCArCiBhcmNo
L3g4Ni9rdm0va3ZtX2VtdWxhdGUuaCAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKIGFyY2gv
eDg2L2t2bS9rdm1pLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDExMzEgKysrKysrKysr
KwogYXJjaC94ODYva3ZtL2t2bWkuaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyNCAr
CiBhcmNoL3g4Ni9rdm0va3ZtaV9tc2cuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgNDU3ICsr
KysKIGFyY2gveDg2L2t2bS9tbXUvbW11LmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNDAg
Ky0KIGFyY2gveDg2L2t2bS9tbXUvbW11X2ludGVybmFsLmggICAgICAgICAgICAgICB8ICAgIDQg
KwogYXJjaC94ODYva3ZtL21tdS9wYWdlX3RyYWNrLmMgICAgICAgICAgICAgICAgIHwgIDE0NiAr
LQogYXJjaC94ODYva3ZtL21tdS9zcHRlLmMgICAgICAgICAgICAgICAgICAgICAgIHwgICAxNyAr
CiBhcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMjg4ICsr
LQogYXJjaC94ODYva3ZtL3N2bS9zdm0uaCAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNyAr
CiBhcmNoL3g4Ni9rdm0vdm14L2NhcGFiaWxpdGllcy5oICAgICAgICAgICAgICAgfCAgICA3ICst
CiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTY4ICst
CiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA0IC0K
IGFyY2gveDg2L2t2bS94ODYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzMDUgKyst
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyAgICAgICAgICAgICAgfCAgICAyICst
CiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggICAgICAgICAgICAgICAgICAgICAgfCAgIDIwICsK
IGluY2x1ZGUvbGludXgva3ZtaV9ob3N0LmggICAgICAgICAgICAgICAgICAgICB8ICAxMTAgKwog
aW5jbHVkZS91YXBpL2xpbnV4L2t2bS5oICAgICAgICAgICAgICAgICAgICAgIHwgICAyMCArCiBp
bmNsdWRlL3VhcGkvbGludXgva3ZtX3BhcmEuaCAgICAgICAgICAgICAgICAgfCAgICA1ICsKIGlu
Y2x1ZGUvdWFwaS9saW51eC9rdm1pLmggICAgICAgICAgICAgICAgICAgICB8ICAyNDUgKysKIHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZSAgICAgICAgICB8ICAgIDEgKwogLi4u
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMgIHwgMjAwNSArKysrKysr
KysrKysrKysrKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMgICAgICAgICAgICAgICAg
IHwgMTI2MyArKysrKysrKysrKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oICAg
ICAgICAgICAgIHwgIDEyOSArKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jICAg
ICAgICAgICAgIHwgIDkxMCArKysrKysrKwogdmlydC9rdm0va3ZtX21haW4uYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICA5NSArCiAzNyBmaWxlcyBjaGFuZ2VkLCA5NTE5IGluc2VydGlv
bnMoKyksIDE2MiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L3ZpcnQva3ZtL2t2bWkucnN0CiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC94ODYvaW5jbHVkZS9h
c20va3ZtaV9ob3N0LmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkv
YXNtL2t2bWkuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gveDg2L2t2bS9rdm1pLmMKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL3g4Ni9rdm0va3ZtaS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC94ODYva3ZtL2t2bWlfbXNnLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L2t2
bWlfaG9zdC5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3Zt
aV90ZXN0LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWku
YwogY3JlYXRlIG1vZGUgMTAwNjQ0IHZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYwoKCmJh
c2UtY29tbWl0OiBkYzkyNGIwNjI0ODhhMDM3NmFhZTQxZDNlMGEyN2RjOTlmODUyYTVlCkNDOiBF
ZHdpbiBaaGFpIDxlZHdpbi56aGFpQGludGVsLmNvbT4KQ0M6IEphbiBLaXN6a2EgPGphbi5raXN6
a2FAc2llbWVucy5jb20+CkNDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9y
YWNsZS5jb20+CkNDOiBNYXRoaWV1IFRhcnJhbCA8bWF0aGlldS50YXJyYWxAcHJvdG9ubWFpbC5j
b20+CkNDOiBQYXRyaWNrIENvbHAgPHBhdHJpY2suY29scEBvcmFjbGUuY29tPgpDQzogU2FtdWVs
IExhdXLDqW4gPHNhbXVlbC5sYXVyZW5AaWtpLmZpPgpDQzogU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPgpDQzogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29t
PgpDQzogV2VpamlhbmcgWWFuZyA8d2VpamlhbmcueWFuZ0BpbnRlbC5jb20+CkNDOiBZdSBDIFpo
YW5nIDx5dS5jLnpoYW5nQGludGVsLmNvbT4KQ0M6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5q
Y0Bnb29nbGUuY29tPgpDQzogSm9lcmcgUm9lZGVsIDxqb3JvQDhieXRlcy5vcmc+CkNDOiBWaXRh
bHkgS3V6bmV0c292IDx2a3V6bmV0c0ByZWRoYXQuY29tPgpDQzogV2FucGVuZyBMaSA8d2FucGVu
Z2xpQHRlbmNlbnQuY29tPgpDQzogSmltIE1hdHRzb24gPGptYXR0c29uQGdvb2dsZS5jb20+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
