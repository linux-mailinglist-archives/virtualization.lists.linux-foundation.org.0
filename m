Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B04921D172
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 10:14:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D60FD25570;
	Mon, 13 Jul 2020 08:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDcLLR1VCmj1; Mon, 13 Jul 2020 08:14:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 604D424DFD;
	Mon, 13 Jul 2020 08:14:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37325C0733;
	Mon, 13 Jul 2020 08:14:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8853FC0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 774C088E4E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id erDJ+CcQzKLq
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:13:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5CBA4875BD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594628034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oDIIbeFWjeiYWcEE6x++JM/zrUI1nqU1Dw3s/3xLuXs=;
 b=NyubdIFc+OQMJ3Q4Xo8PdZf2eLVOfFKDhGfM4Xz+1PlqZrlj6EDx7jViGYlnRF6NbLVUOG
 QYFTqDanPvq6eaTtQsUBQ3xhpaALqglcB3wd5kZtzODvDA5PWvVgF1o/jZ52dO/bymBhNk
 zk8ad7aT5nQPiWrbfhv5PC77mYln4lA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-F44ahv7OO4y7684P9vMV4A-1; Mon, 13 Jul 2020 04:13:52 -0400
X-MC-Unique: F44ahv7OO4y7684P9vMV4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A323B107ACCA;
 Mon, 13 Jul 2020 08:13:51 +0000 (UTC)
Received: from [10.72.13.177] (ovpn-13-177.pek2.redhat.com [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E9B86FEF3;
 Mon, 13 Jul 2020 08:13:36 +0000 (UTC)
Subject: Re: [PATCH 2/7] kvm/vfio: detect assigned device via irqbypass manager
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
References: <1594565366-3195-1-git-send-email-lingshan.zhu@intel.com>
 <1594565366-3195-2-git-send-email-lingshan.zhu@intel.com>
 <20200712170518-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bcb03e95-d8b9-6e19-5b0e-0119d3f43d6d@redhat.com>
Date: Mon, 13 Jul 2020 16:13:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200712170518-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
 sean.j.christopherson@intel.com, virtualization@lists.linux-foundation.org,
 pbonzini@redhat.com
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

Ck9uIDIwMjAvNy8xMyDkuIrljYg1OjA2LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
U3VuLCBKdWwgMTIsIDIwMjAgYXQgMTA6NDk6MjFQTSArMDgwMCwgWmh1IExpbmdzaGFuIHdyb3Rl
Ogo+PiBXZSB1c2VkIHRvIGRldGVjdCBhc3NpZ25lZCBkZXZpY2UgdmlhIFZGSU8gbWFuaXB1bGF0
ZWQgZGV2aWNlCj4+IGNvbnRlcnMuIFRoaXMgaXMgbGVzcyBmbGV4aWJsZSBjb25zaWRlciBWRklP
IGlzIG5vdCB0aGUgb25seQo+PiBpbnRlcmZhY2UgZm9yIGFzc2lnbmVkIGRldmljZS4gdkRQQSBk
ZXZpY2VzIGhhcyBkZWRpY2F0ZWQKPj4gYmFja2VkIGhhcmR3YXJlIGFzIHdlbGwuIFNvIHRoaXMg
cGF0Y2ggdHJpZXMgdG8gZGV0ZWN0Cj4+IHRoZSBhc3NpZ25lZCBkZXZpY2UgdmlhIGlycWJ5cGFz
cyBtYW5hZ2VyLgo+Pgo+PiBXZSB3aWxsIGluY3JlYXNlL2RlY3JlYXNlIHRoZSBhc3NpZ25lZCBk
ZXZpY2UgY291bnRlciBpbiBrdm0veDg2Lgo+PiBCb3RoIHZEUEEgYW5kIFZGSU8gd291bGQgZ28g
dGhyb3VnaCB0aGlzIGNvZGUgcGF0aC4KPj4KPj4gVGhpcyBjb2RlIHBhdGggb25seSBhZmZlY3Qg
eDg2IGZvciBub3cuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4u
emh1QGludGVsLmNvbT4KPgo+IEkgdGhpbmsgaXQncyBiZXN0IHRvIGxlYXZlIFZGSU8gYWxvbmUu
IEFkZCBhcHByb3ByaWF0ZSBBUElzIGZvciBWRFBBLAo+IHdvcnJ5IGFib3V0IGNvbnZlcnRpbmcg
ZXhpc3RpbmcgdXNlcnMgbGF0ZXIuCgoKCkp1c3QgdG8gbWFrZSBzdXJlIEkgdW5kZXJzdGFuZCwg
ZGlkIHlvdSBtZWFuOgoKMSkgaW50cm9kdWNlIGFub3RoZXIgYnJpZGdlIGZvciB2RFBBCgpvcgoK
Mikgb25seSBkZXRlY3QgdkRQQSB2aWEgYnlwYXNzIG1hbmFnZXI/ICh3ZSBjYW4gbGVhdmUgVkZJ
TyBjb2RlIGFzIGlzLCAKdGhlbiB0aGUgYXNzaWduZWQgZGV2aWNlIGNvdW50ZXIgbWF5IGluY3Jl
YXNlL2RlY3JlYXNlIHR3aWNlIGlmIFZGSU8gdXNlIAppcnEgYnlwYXNzIG1hbmFnZXIgd2hpY2gg
c2hvdWxkIGJlIG5vIGhhcm0pLgoKVGhhbmtzCgoKPgo+PiAtLS0KPj4gICBhcmNoL3g4Ni9rdm0v
eDg2LmMgfCAxMCArKysrKysrKy0tCj4+ICAgdmlydC9rdm0vdmZpby5jICAgIHwgIDIgLS0KPj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwo+PiBp
bmRleCAwMGM4OGMyLi4yMGMwN2QzIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3g4Ni9rdm0veDg2LmMK
Pj4gKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jCj4+IEBAIC0xMDYyNCwxMSArMTA2MjQsMTcgQEAg
aW50IGt2bV9hcmNoX2lycV9ieXBhc3NfYWRkX3Byb2R1Y2VyKHN0cnVjdCBpcnFfYnlwYXNzX2Nv
bnN1bWVyICpjb25zLAo+PiAgIHsKPj4gICAJc3RydWN0IGt2bV9rZXJuZWxfaXJxZmQgKmlycWZk
ID0KPj4gICAJCWNvbnRhaW5lcl9vZihjb25zLCBzdHJ1Y3Qga3ZtX2tlcm5lbF9pcnFmZCwgY29u
c3VtZXIpOwo+PiArCWludCByZXQ7Cj4+ICAgCj4+ICAgCWlycWZkLT5wcm9kdWNlciA9IHByb2Q7
Cj4+ICsJa3ZtX2FyY2hfc3RhcnRfYXNzaWdubWVudChpcnFmZC0+a3ZtKTsKPj4gKwlyZXQgPSBr
dm1feDg2X29wcy51cGRhdGVfcGlfaXJ0ZShpcnFmZC0+a3ZtLAo+PiArCQkJCQkgcHJvZC0+aXJx
LCBpcnFmZC0+Z3NpLCAxKTsKPj4gKwo+PiArCWlmIChyZXQpCj4+ICsJCWt2bV9hcmNoX2VuZF9h
c3NpZ25tZW50KGlycWZkLT5rdm0pOwo+PiAgIAo+PiAtCXJldHVybiBrdm1feDg2X29wcy51cGRh
dGVfcGlfaXJ0ZShpcnFmZC0+a3ZtLAo+PiAtCQkJCQkgICBwcm9kLT5pcnEsIGlycWZkLT5nc2ks
IDEpOwo+PiArCXJldHVybiByZXQ7Cj4+ICAgfQo+PiAgIAo+PiAgIHZvaWQga3ZtX2FyY2hfaXJx
X2J5cGFzc19kZWxfcHJvZHVjZXIoc3RydWN0IGlycV9ieXBhc3NfY29uc3VtZXIgKmNvbnMsCj4+
IGRpZmYgLS1naXQgYS92aXJ0L2t2bS92ZmlvLmMgYi92aXJ0L2t2bS92ZmlvLmMKPj4gaW5kZXgg
OGZjYmM1MC4uMTExZGE1MiAxMDA2NDQKPj4gLS0tIGEvdmlydC9rdm0vdmZpby5jCj4+ICsrKyBi
L3ZpcnQva3ZtL3ZmaW8uYwo+PiBAQCAtMjI2LDcgKzIyNiw2IEBAIHN0YXRpYyBpbnQga3ZtX3Zm
aW9fc2V0X2dyb3VwKHN0cnVjdCBrdm1fZGV2aWNlICpkZXYsIGxvbmcgYXR0ciwgdTY0IGFyZykK
Pj4gICAJCWxpc3RfYWRkX3RhaWwoJmt2Zy0+bm9kZSwgJmt2LT5ncm91cF9saXN0KTsKPj4gICAJ
CWt2Zy0+dmZpb19ncm91cCA9IHZmaW9fZ3JvdXA7Cj4+ICAgCj4+IC0JCWt2bV9hcmNoX3N0YXJ0
X2Fzc2lnbm1lbnQoZGV2LT5rdm0pOwo+PiAgIAo+PiAgIAkJbXV0ZXhfdW5sb2NrKCZrdi0+bG9j
ayk7Cj4+ICAgCj4+IEBAIC0yNTQsNyArMjUzLDYgQEAgc3RhdGljIGludCBrdm1fdmZpb19zZXRf
Z3JvdXAoc3RydWN0IGt2bV9kZXZpY2UgKmRldiwgbG9uZyBhdHRyLCB1NjQgYXJnKQo+PiAgIAkJ
CQljb250aW51ZTsKPj4gICAKPj4gICAJCQlsaXN0X2RlbCgma3ZnLT5ub2RlKTsKPj4gLQkJCWt2
bV9hcmNoX2VuZF9hc3NpZ25tZW50KGRldi0+a3ZtKTsKPj4gICAjaWZkZWYgQ09ORklHX1NQQVBS
X1RDRV9JT01NVQo+PiAgIAkJCWt2bV9zcGFwcl90Y2VfcmVsZWFzZV92ZmlvX2dyb3VwKGRldi0+
a3ZtLAo+PiAgIAkJCQkJCQkga3ZnLT52ZmlvX2dyb3VwKTsKPj4gLS0gCj4+IDEuOC4zLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
