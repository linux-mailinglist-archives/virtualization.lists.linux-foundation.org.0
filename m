Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A761821D102
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 09:57:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 55738893F5;
	Mon, 13 Jul 2020 07:57:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BJQ8QI3q0BbM; Mon, 13 Jul 2020 07:57:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C211C893B6;
	Mon, 13 Jul 2020 07:57:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AAE73C0733;
	Mon, 13 Jul 2020 07:57:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE9A0C0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 07:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CD4B8893F3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 07:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qrapznUtqCF0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 07:57:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2DA1C893B6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594627050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e8+mCJV4j7mQFYuPIcpNajGziGnJ6PiL6r+PVquQvQU=;
 b=D3E8hYJ4+N7OP0Uxl7Sv8QnXSYGP19Y+aJ705ijX382tXBrGyeFzRUIlbbExMk66FKGELF
 jnPDjwSHPZNGz5wOua2CGtrf3cWUTzFgGqProKrr6L62ZLz6wsGjTIpSkLA5mfa7q2OHOQ
 RVVahlVy8uIYgcmEvalOlbpVuB/kC08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-AP-3qTOXPDmfFQS-Y8kvsQ-1; Mon, 13 Jul 2020 03:57:27 -0400
X-MC-Unique: AP-3qTOXPDmfFQS-Y8kvsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5DD318FF680;
 Mon, 13 Jul 2020 07:57:25 +0000 (UTC)
Received: from [10.72.13.177] (ovpn-13-177.pek2.redhat.com [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93FBD78A43;
 Mon, 13 Jul 2020 07:57:16 +0000 (UTC)
Subject: Re: [PATCH 2/7] kvm/vfio: detect assigned device via irqbypass manager
To: Alex Williamson <alex.williamson@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
References: <1594565366-3195-1-git-send-email-lingshan.zhu@intel.com>
 <1594565366-3195-2-git-send-email-lingshan.zhu@intel.com>
 <20200712092902.5960f340@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4890e4da-f011-159c-31ec-0ddbbe20bab1@redhat.com>
Date: Mon, 13 Jul 2020 15:57:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200712092902.5960f340@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, sean.j.christopherson@intel.com,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com
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

Ck9uIDIwMjAvNy8xMiDkuIvljYgxMToyOSwgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+IE9uIFN1
biwgMTIgSnVsIDIwMjAgMjI6NDk6MjEgKzA4MDAKPiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpo
dUBpbnRlbC5jb20+IHdyb3RlOgo+Cj4+IFdlIHVzZWQgdG8gZGV0ZWN0IGFzc2lnbmVkIGRldmlj
ZSB2aWEgVkZJTyBtYW5pcHVsYXRlZCBkZXZpY2UKPj4gY29udGVycy4gVGhpcyBpcyBsZXNzIGZs
ZXhpYmxlIGNvbnNpZGVyIFZGSU8gaXMgbm90IHRoZSBvbmx5Cj4+IGludGVyZmFjZSBmb3IgYXNz
aWduZWQgZGV2aWNlLiB2RFBBIGRldmljZXMgaGFzIGRlZGljYXRlZAo+PiBiYWNrZWQgaGFyZHdh
cmUgYXMgd2VsbC4gU28gdGhpcyBwYXRjaCB0cmllcyB0byBkZXRlY3QKPj4gdGhlIGFzc2lnbmVk
IGRldmljZSB2aWEgaXJxYnlwYXNzIG1hbmFnZXIuCj4+Cj4+IFdlIHdpbGwgaW5jcmVhc2UvZGVj
cmVhc2UgdGhlIGFzc2lnbmVkIGRldmljZSBjb3VudGVyIGluIGt2bS94ODYuCj4+IEJvdGggdkRQ
QSBhbmQgVkZJTyB3b3VsZCBnbyB0aHJvdWdoIHRoaXMgY29kZSBwYXRoLgo+Pgo+PiBUaGlzIGNv
ZGUgcGF0aCBvbmx5IGFmZmVjdCB4ODYgZm9yIG5vdy4KPiBObyBpdCBkb2Vzbid0LCBpdCBvbmx5
IGFkZHMgVkZJTyBzdXBwb3J0IHRvIHg4NiwgYnV0IGl0IHJlbW92ZXMgaXQgZnJvbQo+IGFyY2hp
dGVjdHVyZSBuZXV0cmFsIGNvZGUuCgoKRG8geW91IG1lYW4gd2Ugc2hvdWxkIGludHJvZHVjZSBh
IGt2bV9pcnFfYnlwYXNzX2FkZF9wcm9kdWNlciBhbmQgZG8gCmt2bV9hcmNoX3N0YXJ0X2Fzc2ln
bm1lbnQoICkgdGhlcmU/CgoKPiBBbHNvIGEgVkZJTyBkZXZpY2UgZG9lcyBub3QgbmVjZXNzYXJp
bHkKPiBtYWtlIHVzZSBvZiB0aGUgaXJxYnlwYXNzIG1hbmFnZXIsIHRoaXMgZGVwZW5kcyBvbiBw
bGF0Zm9ybSBzdXBwb3J0IGFuZAo+IGVuYWJsZW1lbnQgb2YgdGhpcyBmZWF0dXJlLgoKClllcywg
d2Ugc2hvdWxkIGtlZXAgdGhlIFZGSU8gcGFydCB1bmNoYW5nZWQuCgpUaGFua3MKCgo+ICAgIFRo
ZXJlZm9yZSwgTkFLLiAgVGhhbmtzLAo+Cj4gQWxleAo+ICAgCj4+IFNpZ25lZC1vZmYtYnk6IFpo
dSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC94ODYv
a3ZtL3g4Ni5jIHwgMTAgKysrKysrKystLQo+PiAgIHZpcnQva3ZtL3ZmaW8uYyAgICB8ICAyIC0t
Cj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0veDg2LmMK
Pj4gaW5kZXggMDBjODhjMi4uMjBjMDdkMyAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYva3ZtL3g4
Ni5jCj4+ICsrKyBiL2FyY2gveDg2L2t2bS94ODYuYwo+PiBAQCAtMTA2MjQsMTEgKzEwNjI0LDE3
IEBAIGludCBrdm1fYXJjaF9pcnFfYnlwYXNzX2FkZF9wcm9kdWNlcihzdHJ1Y3QgaXJxX2J5cGFz
c19jb25zdW1lciAqY29ucywKPj4gICB7Cj4+ICAgCXN0cnVjdCBrdm1fa2VybmVsX2lycWZkICpp
cnFmZCA9Cj4+ICAgCQljb250YWluZXJfb2YoY29ucywgc3RydWN0IGt2bV9rZXJuZWxfaXJxZmQs
IGNvbnN1bWVyKTsKPj4gKwlpbnQgcmV0Owo+PiAgIAo+PiAgIAlpcnFmZC0+cHJvZHVjZXIgPSBw
cm9kOwo+PiArCWt2bV9hcmNoX3N0YXJ0X2Fzc2lnbm1lbnQoaXJxZmQtPmt2bSk7Cj4+ICsJcmV0
ID0ga3ZtX3g4Nl9vcHMudXBkYXRlX3BpX2lydGUoaXJxZmQtPmt2bSwKPj4gKwkJCQkJIHByb2Qt
PmlycSwgaXJxZmQtPmdzaSwgMSk7Cj4+ICsKPj4gKwlpZiAocmV0KQo+PiArCQlrdm1fYXJjaF9l
bmRfYXNzaWdubWVudChpcnFmZC0+a3ZtKTsKPj4gICAKPj4gLQlyZXR1cm4ga3ZtX3g4Nl9vcHMu
dXBkYXRlX3BpX2lydGUoaXJxZmQtPmt2bSwKPj4gLQkJCQkJICAgcHJvZC0+aXJxLCBpcnFmZC0+
Z3NpLCAxKTsKPj4gKwlyZXR1cm4gcmV0Owo+PiAgIH0KPj4gICAKPj4gICB2b2lkIGt2bV9hcmNo
X2lycV9ieXBhc3NfZGVsX3Byb2R1Y2VyKHN0cnVjdCBpcnFfYnlwYXNzX2NvbnN1bWVyICpjb25z
LAo+PiBkaWZmIC0tZ2l0IGEvdmlydC9rdm0vdmZpby5jIGIvdmlydC9rdm0vdmZpby5jCj4+IGlu
ZGV4IDhmY2JjNTAuLjExMWRhNTIgMTAwNjQ0Cj4+IC0tLSBhL3ZpcnQva3ZtL3ZmaW8uYwo+PiAr
KysgYi92aXJ0L2t2bS92ZmlvLmMKPj4gQEAgLTIyNiw3ICsyMjYsNiBAQCBzdGF0aWMgaW50IGt2
bV92ZmlvX3NldF9ncm91cChzdHJ1Y3Qga3ZtX2RldmljZSAqZGV2LCBsb25nIGF0dHIsIHU2NCBh
cmcpCj4+ICAgCQlsaXN0X2FkZF90YWlsKCZrdmctPm5vZGUsICZrdi0+Z3JvdXBfbGlzdCk7Cj4+
ICAgCQlrdmctPnZmaW9fZ3JvdXAgPSB2ZmlvX2dyb3VwOwo+PiAgIAo+PiAtCQlrdm1fYXJjaF9z
dGFydF9hc3NpZ25tZW50KGRldi0+a3ZtKTsKPj4gICAKPj4gICAJCW11dGV4X3VubG9jaygma3Yt
PmxvY2spOwo+PiAgIAo+PiBAQCAtMjU0LDcgKzI1Myw2IEBAIHN0YXRpYyBpbnQga3ZtX3ZmaW9f
c2V0X2dyb3VwKHN0cnVjdCBrdm1fZGV2aWNlICpkZXYsIGxvbmcgYXR0ciwgdTY0IGFyZykKPj4g
ICAJCQkJY29udGludWU7Cj4+ICAgCj4+ICAgCQkJbGlzdF9kZWwoJmt2Zy0+bm9kZSk7Cj4+IC0J
CQlrdm1fYXJjaF9lbmRfYXNzaWdubWVudChkZXYtPmt2bSk7Cj4+ICAgI2lmZGVmIENPTkZJR19T
UEFQUl9UQ0VfSU9NTVUKPj4gICAJCQlrdm1fc3BhcHJfdGNlX3JlbGVhc2VfdmZpb19ncm91cChk
ZXYtPmt2bSwKPj4gICAJCQkJCQkJIGt2Zy0+dmZpb19ncm91cCk7CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
