Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E140B1EC83D
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 06:19:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 25A8E8693D;
	Wed,  3 Jun 2020 04:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rZ5BKcEAKYK9; Wed,  3 Jun 2020 04:19:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8601486946;
	Wed,  3 Jun 2020 04:19:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FE4BC016E;
	Wed,  3 Jun 2020 04:19:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF325C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 04:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BD6D58693D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 04:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJ91J7VGQU0I
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 04:18:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BE4938692B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 04:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591157938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9xmDIzzeJFmx6PBS/p46/Kx8Jkci56FFIVCj3VdkRT8=;
 b=huGDM1r++/S2JLPOCvVu7VzzVn2B2odZ3PR3YQQDF2DDUKcfD7XUGxnQTaEoeJ9WBYLG7A
 qyhza1BVfJ47CtcC3jmHBDKpQaHz1HZinkVSOrTjv/3qXBDSgFctp5MLWT9wx0IpnSAGqM
 AYyZS3M6uZJ7mBywu2ZziIqFQ1StN3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-9cqdcdTcOAK175-ap0_q_A-1; Wed, 03 Jun 2020 00:18:54 -0400
X-MC-Unique: 9cqdcdTcOAK175-ap0_q_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 297FD461;
 Wed,  3 Jun 2020 04:18:53 +0000 (UTC)
Received: from [10.72.12.214] (ovpn-12-214.pek2.redhat.com [10.72.12.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46AF86C77F;
 Wed,  3 Jun 2020 04:18:45 +0000 (UTC)
Subject: Re: [PATCH 4/6] vhost_vdpa: support doorbell mapping via mmap
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200529080303.15449-5-jasowang@redhat.com>
 <202006020308.kLXTHt4n%lkp@intel.com>
 <20200602005007-mutt-send-email-mst@kernel.org>
 <bd7dde11-b726-ee08-4e80-71fb784fa549@redhat.com>
 <20200602093025-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5db6b413-cb6c-a566-2f2d-ad580d8e165b@redhat.com>
Date: Wed, 3 Jun 2020 12:18:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602093025-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: kbuild-all@lists.01.org, kbuild test robot <lkp@intel.com>,
 kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 lingshan.zhu@intel.com, lulu@redhat.com, rob.miller@broadcom.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNi8yIOS4i+WNiDk6MzEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBU
dWUsIEp1biAwMiwgMjAyMCBhdCAwMjo0OTozOFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzYvMiDkuIvljYgxMjo1NiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4g
T24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMDM6MjI6NDlBTSArMDgwMCwga2J1aWxkIHRlc3Qgcm9i
b3Qgd3JvdGU6Cj4+Pj4gSGkgSmFzb24sCj4+Pj4KPj4+PiBJIGxvdmUgeW91ciBwYXRjaCEgWWV0
IHNvbWV0aGluZyB0byBpbXByb3ZlOgo+Pj4+Cj4+Pj4gW2F1dG8gYnVpbGQgdGVzdCBFUlJPUiBv
biB2aG9zdC9saW51eC1uZXh0XQo+Pj4+IFthbHNvIGJ1aWxkIHRlc3QgRVJST1Igb24gbGludXMv
bWFzdGVyIHY1LjcgbmV4dC0yMDIwMDUyOV0KPj4+PiBbaWYgeW91ciBwYXRjaCBpcyBhcHBsaWVk
IHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwgcGxlYXNlIGRyb3AgdXMgYSBub3RlIHRvIGhlbHAKPj4+
PiBpbXByb3ZlIHRoZSBzeXN0ZW0uIEJUVywgd2UgYWxzbyBzdWdnZXN0IHRvIHVzZSAnLS1iYXNl
JyBvcHRpb24gdG8gc3BlY2lmeSB0aGUKPj4+PiBiYXNlIHRyZWUgaW4gZ2l0IGZvcm1hdC1wYXRj
aCwgcGxlYXNlIHNlZWh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vYS8zNzQwNjk4Ml0KPj4+Pgo+
Pj4+IHVybDpodHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL0phc29uLVdh
bmcvdkRQQS1kb29yYmVsbC1tYXBwaW5nLzIwMjAwNTMxLTA3MDgzNAo+Pj4+IGJhc2U6aHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXN0L3Zob3N0LmdpdCAg
bGludXgtbmV4dAo+Pj4+IGNvbmZpZzogbTY4ay1yYW5kY29uZmlnLXIwMTEtMjAyMDA2MDEgKGF0
dGFjaGVkIGFzIC5jb25maWcpCj4+Pj4gY29tcGlsZXI6IG02OGstbGludXgtZ2NjIChHQ0MpIDku
My4wCj4+Pj4gcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0xIGJ1aWxkKToKPj4+PiAgICAgICAgICAg
d2dldGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMvbWFz
dGVyL3NiaW4vbWFrZS5jcm9zcyAgLU8gfi9iaW4vbWFrZS5jcm9zcwo+Pj4+ICAgICAgICAgICBj
aG1vZCAreCB+L2Jpbi9tYWtlLmNyb3NzCj4+Pj4gICAgICAgICAgICMgc2F2ZSB0aGUgYXR0YWNo
ZWQgLmNvbmZpZyB0byBsaW51eCBidWlsZCB0cmVlCj4+Pj4gICAgICAgICAgIENPTVBJTEVSX0lO
U1RBTExfUEFUSD0kSE9NRS8wZGF5IENPTVBJTEVSPWdjYy05LjMuMCBtYWtlLmNyb3NzIEFSQ0g9
bTY4awo+Pj4+Cj4+Pj4gSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5n
IHRhZyBhcyBhcHByb3ByaWF0ZQo+Pj4+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdDxs
a3BAaW50ZWwuY29tPgo+Pj4+Cj4+Pj4gQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkg
Pj4sIG9sZCBvbmVzIHByZWZpeGVkIGJ5IDw8KToKPj4+Pgo+Pj4+IGRyaXZlcnMvdmhvc3QvdmRw
YS5jOiBJbiBmdW5jdGlvbiAndmhvc3RfdmRwYV9mYXVsdCc6Cj4+Pj4+PiBkcml2ZXJzL3Zob3N0
L3ZkcGEuYzo3NTQ6MjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAn
cGdwcm90X25vbmNhY2hlZCcgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25d
Cj4+Pj4gNzU0IHwgIHZtYS0+dm1fcGFnZV9wcm90ID0gcGdwcm90X25vbmNhY2hlZCh2bWEtPnZt
X3BhZ2VfcHJvdCk7Cj4+Pj4gfCAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
Cj4+Pj4+PiBkcml2ZXJzL3Zob3N0L3ZkcGEuYzo3NTQ6MjI6IGVycm9yOiBpbmNvbXBhdGlibGUg
dHlwZXMgd2hlbiBhc3NpZ25pbmcgdG8gdHlwZSAncGdwcm90X3QnIHtha2EgJ3N0cnVjdCA8YW5v
bnltb3VzPid9IGZyb20gdHlwZSAnaW50Jwo+Pj4+IGNjMTogc29tZSB3YXJuaW5ncyBiZWluZyB0
cmVhdGVkIGFzIGVycm9ycwo+Pj4+Cj4+Pj4gdmltICsvcGdwcm90X25vbmNhY2hlZCArNzU0IGRy
aXZlcnMvdmhvc3QvdmRwYS5jCj4+Pj4KPj4+PiAgICAgIDc0MgkKPj4+PiAgICAgIDc0MwlzdGF0
aWMgdm1fZmF1bHRfdCB2aG9zdF92ZHBhX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+Pj4+
ICAgICAgNzQ0CXsKPj4+PiAgICAgIDc0NQkJc3RydWN0IHZob3N0X3ZkcGEgKnYgPSB2bWYtPnZt
YS0+dm1fZmlsZS0+cHJpdmF0ZV9kYXRhOwo+Pj4+ICAgICAgNzQ2CQlzdHJ1Y3QgdmRwYV9kZXZp
Y2UgKnZkcGEgPSB2LT52ZHBhOwo+Pj4+ICAgICAgNzQ3CQljb25zdCBzdHJ1Y3QgdmRwYV9jb25m
aWdfb3BzICpvcHMgPSB2ZHBhLT5jb25maWc7Cj4+Pj4gICAgICA3NDgJCXN0cnVjdCB2ZHBhX25v
dGlmaWNhdGlvbl9hcmVhIG5vdGlmeTsKPj4+PiAgICAgIDc0OQkJc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEgPSB2bWYtPnZtYTsKPj4+PiAgICAgIDc1MAkJdTE2IGluZGV4ID0gdm1hLT52bV9w
Z29mZjsKPj4+PiAgICAgIDc1MQkKPj4+PiAgICAgIDc1MgkJbm90aWZ5ID0gb3BzLT5nZXRfdnFf
bm90aWZpY2F0aW9uKHZkcGEsIGluZGV4KTsKPj4+PiAgICAgIDc1MwkKPj4+PiAgICA+IDc1NAkJ
dm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfbm9uY2FjaGVkKHZtYS0+dm1fcGFnZV9wcm90KTsK
Pj4+PiAgICAgIDc1NQkJaWYgKHJlbWFwX3Bmbl9yYW5nZSh2bWEsIHZtZi0+YWRkcmVzcyAmIFBB
R0VfTUFTSywKPj4+PiAgICAgIDc1NgkJCQkgICAgbm90aWZ5LmFkZHIgPj4gUEFHRV9TSElGVCwg
UEFHRV9TSVpFLAo+Pj4+ICAgICAgNzU3CQkJCSAgICB2bWEtPnZtX3BhZ2VfcHJvdCkpCj4+Pj4g
ICAgICA3NTgJCQlyZXR1cm4gVk1fRkFVTFRfU0lHQlVTOwo+Pj4+ICAgICAgNzU5CQo+Pj4+ICAg
ICAgNzYwCQlyZXR1cm4gVk1fRkFVTFRfTk9QQUdFOwo+Pj4+ICAgICAgNzYxCX0KPj4+PiAgICAg
IDc2MgkKPj4+IFllcyB3ZWxsLCBhbGwgdGhpcyByZW1hcHBpbmcgY2xlYXJseSBoYXMgbm8gY2hh
bmNlIHRvIHdvcmsKPj4+IG9uIHN5c3RlbXMgd2l0aG91dCBDT05GSUdfTU1VLgo+Pgo+PiBJdCBs
b29rcyB0byBtZSBtbWFwIGNhbiB3b3JrIGFjY29yZGluZyB0byBEb2N1bWVudGF0aW9uL25vbW11
LW1tYXAudHh0LiBCdXQKPj4gSSdtIG5vdCBzdXJlIGl0J3Mgd29ydGggdG8gYm90aGVyLgo+Pgo+
PiBUaGFua3MKPgo+IFdlbGwKPgo+IGludCByZW1hcF9wZm5fcmFuZ2Uoc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgcGZuLCB1bnNpZ25lZCBsb25nIHNpemUsIHBncHJvdF90IHByb3QpCj4gewo+ICAg
ICAgICAgIGlmIChhZGRyICE9IChwZm4gPDwgUEFHRV9TSElGVCkpCj4gICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPgo+ICAgICAgICAgIHZtYS0+dm1fZmxhZ3MgfD0gVk1fSU8gfCBW
TV9QRk5NQVAgfCBWTV9ET05URVhQQU5EIHwgVk1fRE9OVERVTVA7Cj4gICAgICAgICAgcmV0dXJu
IDA7Cj4gfQo+IEVYUE9SVF9TWU1CT0wocmVtYXBfcGZuX3JhbmdlKTsKPgo+Cj4gU28gdGhpbmdz
IGFyZW4ndCBnb2luZyB0byB3b3JrIGlmIHlvdSBoYXZlIGEgZml4ZWQgUEZOCj4gd2hpY2ggaXMg
dGhlIGNhc2Ugb2YgdGhlIGhhcmR3YXJlIGRldmljZS4KCgpMb29raW5nIGF0IHRoZSBpbXBsZW1l
bnRhdGlvbiBvZiBzb21lIGRyaXZlcnMgZS5nIG10ZF9jaGFyLiBJZiBJIHJlYWQgCnRoZSBjb2Rl
IGNvcnJlY3RseSwgd2UgY2FuIGRvIHRoaXMgYnkgcHJvdmlkaW5nIGdldF91bm1hcHBlZF9hcmVh
IG1ldGhvZCAKYW5kIHVzZSBwaHlzaWNhbCBhZGRyZXNzIGRpcmVjdGx5LgoKQnV0IHN0YXJ0IGZv
cm0gQ09ORklHX01NVSBzaG91bGQgYmUgZmluZS7CoCBEbyB5b3UgcHJlZmVyIG1ha2luZyAKdmhv
c3RfdmRwYSBkZXBlbmRzIG9uIENPTkZJR19NTVUgb3IganVzdCBmYWlsIG1tYXAgd2hlbiBDT05G
SUdfTU1VIGlzIApub3QgY29uZmlndXJlZD8KClRoYW5rcwoKCj4KPgo+Pj4KPj4+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
