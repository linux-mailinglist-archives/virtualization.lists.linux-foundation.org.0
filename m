Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E74522567D
	for <lists.virtualization@lfdr.de>; Mon, 20 Jul 2020 06:20:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8A79C87ED0;
	Mon, 20 Jul 2020 04:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYz3ODDSLWdn; Mon, 20 Jul 2020 04:19:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E3AF187F71;
	Mon, 20 Jul 2020 04:19:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7F3DC016F;
	Mon, 20 Jul 2020 04:19:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4765AC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 04:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2000420528
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 04:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zf0YfofblVAN
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 04:19:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 2230720513
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 04:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595218792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04wRZDzfAbjzY24AOQSUyoqCb/wNOPZL7NBzxLPbzVc=;
 b=Th5aOFzFuuITP3XQy8b+7s/gwxOp6ibKciGcBdhxuaggEZQQIIZ2LvVSBlyk9mb7L3LwMk
 +LtKXIAnzx2+UUHUn2LCKtxC/u1OwLylpLp8ZC/YeR4gdxjfCVdGrCk3SM+zZ55M62tzAo
 5Dd8oSA5qMCTdp7oeLthLSl3r+5WyIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-9KzyVAvVO_aogPSdmTB61Q-1; Mon, 20 Jul 2020 00:19:51 -0400
X-MC-Unique: 9KzyVAvVO_aogPSdmTB61Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FF53107ACCA;
 Mon, 20 Jul 2020 04:19:49 +0000 (UTC)
Received: from [10.72.13.139] (ovpn-13-139.pek2.redhat.com [10.72.13.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B12925C1B2;
 Mon, 20 Jul 2020 04:19:38 +0000 (UTC)
Subject: Re: [PATCH V2 2/6] kvm: detect assigned device via irqbypass manager
To: Alex Williamson <alex.williamson@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
References: <1594898629-18790-1-git-send-email-lingshan.zhu@intel.com>
 <1594898629-18790-3-git-send-email-lingshan.zhu@intel.com>
 <20200717120821.3c2a56db@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c46dc561-610e-e992-8bb9-e7286a560971@redhat.com>
Date: Mon, 20 Jul 2020 12:19:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717120821.3c2a56db@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Ck9uIDIwMjAvNy8xOCDkuIrljYgyOjA4LCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gT24gVGh1
LCAxNiBKdWwgMjAyMCAxOToyMzo0NSArMDgwMAo+IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1
QGludGVsLmNvbT4gd3JvdGU6Cj4KPj4gdkRQQSBkZXZpY2VzIGhhcyBkZWRpY2F0ZWQgYmFja2Vk
IGhhcmR3YXJlIGxpa2UKPj4gcGFzc3Rocm91Z2gtZWQgZGV2aWNlcy4gVGhlbiBpdCBpcyBwb3Nz
aWJsZSB0byBzZXR1cCBpcnEKPj4gb2ZmbG9hZGluZyB0byB2Q1BVIGZvciB2RFBBIGRldmljZXMu
IFRodXMgdGhpcyBwYXRjaCB0cmllcyB0bwo+PiBtYW5pcHVsYXRlZCBhc3NpZ25lZCBkZXZpY2Ug
Y291bnRlcnMgdmlhIGlycWJ5cGFzcyBtYW5hZ2VyLgo+Pgo+PiBXZSB3aWxsIGluY3JlYXNlL2Rl
Y3JlYXNlIHRoZSBhc3NpZ25lZCBkZXZpY2UgY291bnRlciBpbiBrdm0veDg2Lgo+PiBCb3RoIHZE
UEEgYW5kIFZGSU8gd291bGQgZ28gdGhyb3VnaCB0aGlzIGNvZGUgcGF0aC4KPj4KPj4gVGhpcyBj
b2RlIHBhdGggb25seSBhZmZlY3QgeDg2IGZvciBub3cuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFpo
dSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4KPj4gU3VnZ2VzdGVkLWJ5OiBKYXNv
biBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+PiAtLS0KPj4gICBhcmNoL3g4Ni9rdm0veDg2
LmMgfCAxMCArKysrKysrKy0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBiL2Fy
Y2gveDg2L2t2bS94ODYuYwo+PiBpbmRleCAwMGM4OGMyLi4yMGMwN2QzIDEwMDY0NAo+PiAtLS0g
YS9hcmNoL3g4Ni9rdm0veDg2LmMKPj4gKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jCj4+IEBAIC0x
MDYyNCwxMSArMTA2MjQsMTcgQEAgaW50IGt2bV9hcmNoX2lycV9ieXBhc3NfYWRkX3Byb2R1Y2Vy
KHN0cnVjdCBpcnFfYnlwYXNzX2NvbnN1bWVyICpjb25zLAo+PiAgIHsKPj4gICAJc3RydWN0IGt2
bV9rZXJuZWxfaXJxZmQgKmlycWZkID0KPj4gICAJCWNvbnRhaW5lcl9vZihjb25zLCBzdHJ1Y3Qg
a3ZtX2tlcm5lbF9pcnFmZCwgY29uc3VtZXIpOwo+PiArCWludCByZXQ7Cj4+ICAgCj4+ICAgCWly
cWZkLT5wcm9kdWNlciA9IHByb2Q7Cj4+ICsJa3ZtX2FyY2hfc3RhcnRfYXNzaWdubWVudChpcnFm
ZC0+a3ZtKTsKPj4gKwlyZXQgPSBrdm1feDg2X29wcy51cGRhdGVfcGlfaXJ0ZShpcnFmZC0+a3Zt
LAo+PiArCQkJCQkgcHJvZC0+aXJxLCBpcnFmZC0+Z3NpLCAxKTsKPj4gKwo+PiArCWlmIChyZXQp
Cj4+ICsJCWt2bV9hcmNoX2VuZF9hc3NpZ25tZW50KGlycWZkLT5rdm0pOwo+PiAgIAo+PiAtCXJl
dHVybiBrdm1feDg2X29wcy51cGRhdGVfcGlfaXJ0ZShpcnFmZC0+a3ZtLAo+PiAtCQkJCQkgICBw
cm9kLT5pcnEsIGlycWZkLT5nc2ksIDEpOwo+PiArCXJldHVybiByZXQ7Cj4+ICAgfQo+PiAgIAo+
PiAgIHZvaWQga3ZtX2FyY2hfaXJxX2J5cGFzc19kZWxfcHJvZHVjZXIoc3RydWN0IGlycV9ieXBh
c3NfY29uc3VtZXIgKmNvbnMsCj4KPiBXaHkgaXNuJ3QgdGhlcmUgYSBtYXRjaGluZyBlbmQtYXNz
aWdubWVudCBpbiB0aGUgZGVsX3Byb2R1Y2VyIHBhdGg/ICBJdAo+IHNlZW1zIHRoaXMgb25seSBn
b2VzIG9uZS13YXksIHdoYXQgaGFwcGVucyB3aGVuIGEgZGV2aWNlIGlzCj4gaG90LXVucGx1Z2dl
ZCBmcm9tIHRoZSBWTSBvciB0aGUgZGV2aWNlIGludGVycnVwdCBjb25maWd1cmF0aW9uIGNoYW5n
ZXMuCj4gVGhpcyB3aWxsIHN0aWxsIGJyZWFrIHZmaW8gaWYgaXQncyBub3QgZ3VhcmFudGVlZCB0
byBiZSBzeW1tZXRyaWMuCj4gVGhhbmtzLAo+Cj4gQWxleAoKClllcywgd2UgbmVlZCBhZGQgbG9n
aWMgaW4gdGhlIGRlbF9wcm9kdWNlciBwYXRoLgoKVGhhbmtzCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
