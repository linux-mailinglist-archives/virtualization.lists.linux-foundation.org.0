Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2350419AE4A
	for <lists.virtualization@lfdr.de>; Wed,  1 Apr 2020 16:51:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A5CBC883F1;
	Wed,  1 Apr 2020 14:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z07omb9+loDg; Wed,  1 Apr 2020 14:51:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E5C3E883E2;
	Wed,  1 Apr 2020 14:51:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BEB67C089F;
	Wed,  1 Apr 2020 14:51:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19285C089F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 10D6986DD6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCnAarq3Yh1A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:51:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2C68F86D90
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585752676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5n1TpAtrCmO/OxJ7W2yFz2Sp/6yT7ouLorwkqMfl51s=;
 b=Yub8mjC4FnLy3UWZawBaOh4tRD3oQFFXbr60wcO43qUnNxo5RYI+5KpRfmJVfsKZsHGC8J
 FwFJ41Fj/RGMM0ct/nlD6cL22WTVxrITv5PeVIicrCG2sLL23/iUjZPYQzsb2C4tvNiYu+
 aKQMaSWfrJ/+6RWqXsX0UfS2XHQr5Wk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-6pRfZq5iMh24YqoQc1E2ag-1; Wed, 01 Apr 2020 10:51:14 -0400
X-MC-Unique: 6pRfZq5iMh24YqoQc1E2ag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20A95477;
 Wed,  1 Apr 2020 14:51:11 +0000 (UTC)
Received: from [10.72.12.139] (ovpn-12-139.pek2.redhat.com [10.72.12.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC87D98A53;
 Wed,  1 Apr 2020 14:50:52 +0000 (UTC)
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <fde312a4-56bd-f11f-799f-8aa952008012@de.ibm.com>
 <41ee1f6a-3124-d44b-bf34-0f26604f9514@redhat.com>
 <4726da4c-11ec-3b6e-1218-6d6d365d5038@de.ibm.com>
 <39b96e3a-9f4e-6e1d-e988-8c4bcfb55879@de.ibm.com>
 <c423c5b1-7817-7417-d7af-e07bef6368e7@redhat.com>
 <20200401102631-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5e409bb4-2b06-5193-20c3-a9ddaafacf5a@redhat.com>
Date: Wed, 1 Apr 2020 22:50:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200401102631-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, hanand@xilinx.com,
 hch@infradead.org, eperezma@redhat.com, jgg@mellanox.com, shahafs@mellanox.com,
 parav@mellanox.com, vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
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

Ck9uIDIwMjAvNC8xIOS4i+WNiDEwOjI3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
V2VkLCBBcHIgMDEsIDIwMjAgYXQgMTA6MTM6MjlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC80LzEg5LiL5Y2IOTowMiwgQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIHdyb3RlOgo+
Pj4gT24gMDEuMDQuMjAgMTQ6NTYsIENocmlzdGlhbiBCb3JudHJhZWdlciB3cm90ZToKPj4+PiBP
biAwMS4wNC4yMCAxNDo1MCwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pj4gT24gMjAyMC80LzEg5LiL
5Y2INzoyMSwgQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIHdyb3RlOgo+Pj4+Pj4gT24gMjYuMDMuMjAg
MTU6MDEsIEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4+Pj4gQ3VycmVudGx5LCBDT05GSUdfVkhPU1Qg
ZGVwZW5kcyBvbiBDT05GSUdfVklSVFVBTElaQVRJT04uIEJ1dCB2aG9zdCBpcwo+Pj4+Pj4+IG5v
dCBuZWNlc3NhcmlseSBmb3IgVk0gc2luY2UgaXQncyBhIGdlbmVyaWMgdXNlcnNwYWNlIGFuZCBr
ZXJuZWwKPj4+Pj4+PiBjb21tdW5pY2F0aW9uIHByb3RvY29sLiBTdWNoIGRlcGVuZGVuY3kgbWF5
IHByZXZlbnQgYXJjaHMgd2l0aG91dAo+Pj4+Pj4+IHZpcnR1YWxpemF0aW9uIHN1cHBvcnQgZnJv
bSB1c2luZyB2aG9zdC4KPj4+Pj4+Pgo+Pj4+Pj4+IFRvIHNvbHZlIHRoaXMsIGEgZGVkaWNhdGVk
IHZob3N0IG1lbnUgaXMgY3JlYXRlZCB1bmRlciBkcml2ZXJzIHNvCj4+Pj4+Pj4gQ09OSUZHX1ZI
T1NUIGNhbiBiZSBkZWNvdXBsZWQgb3V0IG9mIENPTkZJR19WSVJUVUFMSVpBVElPTi4KPj4+Pj4+
IEZXSVcsIHRoaXMgbm93IHJlc3VsdHMgaW4gdmhvc3Qgbm90IGJlaW5nIGJ1aWxkIHdpdGggZGVm
Y29uZmlnIGtlcm5lbHMgKGluIHRvZGF5cwo+Pj4+Pj4gbGludXgtbmV4dCkuCj4+Pj4+Pgo+Pj4+
PiBIaSBDaHJpc3RpYW46Cj4+Pj4+Cj4+Pj4+IERpZCB5b3UgbWVldCBpdCBldmVuIHdpdGggdGhp
cyBjb21taXTCoGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0Lz9pZD1hNGJlNDBjYmNlZGJhOWI1YjcxNGYzYzk1
MTgyZThhNDUxNzZlNDJkPwo+Pj4+IEkgc2ltcGx5IHVzZWQgbGludXgtbmV4dC4gVGhlIGRlZmNv
bmZpZyBkb2VzIE5PVCBjb250YWluIENPTkZJR19WSE9TVCBhbmQgdGhlcmVmb3JlIENPTkZJR19W
SE9TVF9ORVQgYW5kIGZyaWVuZHMKPj4+PiBjYW4gbm90IGJlIHNlbGVjdGVkLgo+Pj4+Cj4+Pj4g
JCBnaXQgY2hlY2tvdXQgbmV4dC0yMDIwMDQwMQo+Pj4+ICQgbWFrZSBkZWZjb25maWcKPj4+PiAg
ICAgSE9TVENDICBzY3JpcHRzL2Jhc2ljL2ZpeGRlcAo+Pj4+ICAgICBIT1NUQ0MgIHNjcmlwdHMv
a2NvbmZpZy9jb25mLm8KPj4+PiAgICAgSE9TVENDICBzY3JpcHRzL2tjb25maWcvY29uZmRhdGEu
bwo+Pj4+ICAgICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9leHByLm8KPj4+PiAgICAgTEVYICAg
ICBzY3JpcHRzL2tjb25maWcvbGV4ZXIubGV4LmMKPj4+PiAgICAgWUFDQyAgICBzY3JpcHRzL2tj
b25maWcvcGFyc2VyLnRhYi5bY2hdCj4+Pj4gICAgIEhPU1RDQyAgc2NyaXB0cy9rY29uZmlnL2xl
eGVyLmxleC5vCj4+Pj4gICAgIEhPU1RDQyAgc2NyaXB0cy9rY29uZmlnL3BhcnNlci50YWIubwo+
Pj4+ICAgICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9wcmVwcm9jZXNzLm8KPj4+PiAgICAgSE9T
VENDICBzY3JpcHRzL2tjb25maWcvc3ltYm9sLm8KPj4+PiAgICAgSE9TVENDICBzY3JpcHRzL2tj
b25maWcvdXRpbC5vCj4+Pj4gICAgIEhPU1RMRCAgc2NyaXB0cy9rY29uZmlnL2NvbmYKPj4+PiAq
KiogRGVmYXVsdCBjb25maWd1cmF0aW9uIGlzIGJhc2VkIG9uICd4ODZfNjRfZGVmY29uZmlnJwo+
Pj4+ICMKPj4+PiAjIGNvbmZpZ3VyYXRpb24gd3JpdHRlbiB0byAuY29uZmlnCj4+Pj4gIwo+Pj4+
Cj4+Pj4gJCBncmVwIFZIT1NUIC5jb25maWcKPj4+PiAjIENPTkZJR19WSE9TVCBpcyBub3Qgc2V0
Cj4+Pj4KPj4+Pj4gSWYgeWVzLCB3aGF0J3MgeW91ciBidWlsZCBjb25maWcgbG9va3MgbGlrZT8K
Pj4+Pj4KPj4+Pj4gVGhhbmtzCj4+PiBUaGlzIHdhcyB4ODYuIE5vdCBzdXJlIGlmIHRoYXQgZGlk
IHdvcmsgYmVmb3JlLgo+Pj4gT24gczM5MCB0aGlzIGlzIGRlZmluaXRlbHkgYSByZWdyZXNzaW9u
IGFzIHRoZSBkZWZjb25maWcgZmlsZXMKPj4+IGZvciBzMzkwIGRvIHNlbGVjdCBWSE9TVF9ORVQK
Pj4+Cj4+PiBncmVwIFZIT1NUIGFyY2gvczM5MC9jb25maWdzLyoKPj4+IGFyY2gvczM5MC9jb25m
aWdzL2RlYnVnX2RlZmNvbmZpZzpDT05GSUdfVkhPU1RfTkVUPW0KPj4+IGFyY2gvczM5MC9jb25m
aWdzL2RlYnVnX2RlZmNvbmZpZzpDT05GSUdfVkhPU1RfVlNPQ0s9bQo+Pj4gYXJjaC9zMzkwL2Nv
bmZpZ3MvZGVmY29uZmlnOkNPTkZJR19WSE9TVF9ORVQ9bQo+Pj4gYXJjaC9zMzkwL2NvbmZpZ3Mv
ZGVmY29uZmlnOkNPTkZJR19WSE9TVF9WU09DSz1tCj4+Pgo+Pj4gYW5kIHRoaXMgd29ya2VkIHdp
dGggNS42LCBidXQgZG9lcyBub3Qgd29yayB3aXRoIG5leHQuIEp1c3QgYWRkaW5nCj4+PiBDT05G
SUdfVkhPU1Q9bSB0byB0aGUgZGVmY29uZmlnIHNvbHZlcyB0aGUgaXNzdWUsIHNvbWV0aGluZyBs
aWtlCj4+Cj4+IFJpZ2h0LCBJIHRoaW5rIHdlIHByb2JhYmx5IG5lZWQKPj4KPj4gMSkgYWRkIENP
TkZJR19WSE9TVD1tIHRvIGFsbCBkZWZjb25maWdzIHRoYXQgZW5hYmxlcwo+PiBDT05GSUdfVkhP
U1RfTkVUL1ZTT0NLL1NDU0kuCj4+Cj4+IG9yCj4+Cj4+IDIpIGRvbid0IHVzZSBtZW51Y29uZmln
IGZvciBDT05GSUdfVkhPU1QsIGxldCBORVQvU0NTSS9WRFBBIGp1c3Qgc2VsZWN0IGl0Lgo+Pgo+
PiBUaGFua3MKPiBPSyBJIHRyaWVkIHRoaXM6Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9z
dC9LY29uZmlnIGIvZHJpdmVycy92aG9zdC9LY29uZmlnCj4gaW5kZXggMjUyM2ExZDQyOTBhLi5h
MzE0YjkwMGQ0NzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9zdC9LY29uZmlnCj4gKysrIGIv
ZHJpdmVycy92aG9zdC9LY29uZmlnCj4gQEAgLTE5LDExICsxOSwxMCBAQCBtZW51Y29uZmlnIFZI
T1NUCj4gICAJICBUaGlzIG9wdGlvbiBpcyBzZWxlY3RlZCBieSBhbnkgZHJpdmVyIHdoaWNoIG5l
ZWRzIHRvIGFjY2Vzcwo+ICAgCSAgdGhlIGNvcmUgb2Ygdmhvc3QuCj4gICAKPiAtaWYgVkhPU1QK
PiAtCj4gICBjb25maWcgVkhPU1RfTkVUCj4gICAJdHJpc3RhdGUgIkhvc3Qga2VybmVsIGFjY2Vs
ZXJhdG9yIGZvciB2aXJ0aW8gbmV0Igo+ICAgCWRlcGVuZHMgb24gTkVUICYmIEVWRU5URkQgJiYg
KFRVTiB8fCAhVFVOKSAmJiAoVEFQIHx8ICFUQVApCj4gKwlzZWxlY3QgVkhPU1QKPiAgIAktLS1o
ZWxwLS0tCj4gICAJICBUaGlzIGtlcm5lbCBtb2R1bGUgY2FuIGJlIGxvYWRlZCBpbiBob3N0IGtl
cm5lbCB0byBhY2NlbGVyYXRlCj4gICAJICBndWVzdCBuZXR3b3JraW5nIHdpdGggdmlydGlvX25l
dC4gTm90IHRvIGJlIGNvbmZ1c2VkIHdpdGggdmlydGlvX25ldAo+IEBAIC0zNSw2ICszNCw3IEBA
IGNvbmZpZyBWSE9TVF9ORVQKPiAgIGNvbmZpZyBWSE9TVF9TQ1NJCj4gICAJdHJpc3RhdGUgIlZI
T1NUX1NDU0kgVENNIGZhYnJpYyBkcml2ZXIiCj4gICAJZGVwZW5kcyBvbiBUQVJHRVRfQ09SRSAm
JiBFVkVOVEZECj4gKwlzZWxlY3QgVkhPU1QKPiAgIAlkZWZhdWx0IG4KPiAgIAktLS1oZWxwLS0t
Cj4gICAJU2F5IE0gaGVyZSB0byBlbmFibGUgdGhlIHZob3N0X3Njc2kgVENNIGZhYnJpYyBtb2R1
bGUKPiBAQCAtNDQsNiArNDQsNyBAQCBjb25maWcgVkhPU1RfVlNPQ0sKPiAgIAl0cmlzdGF0ZSAi
dmhvc3QgdmlydGlvLXZzb2NrIGRyaXZlciIKPiAgIAlkZXBlbmRzIG9uIFZTT0NLRVRTICYmIEVW
RU5URkQKPiAgIAlzZWxlY3QgVklSVElPX1ZTT0NLRVRTX0NPTU1PTgo+ICsJc2VsZWN0IFZIT1NU
Cj4gICAJZGVmYXVsdCBuCj4gICAJLS0taGVscC0tLQo+ICAgCVRoaXMga2VybmVsIG1vZHVsZSBj
YW4gYmUgbG9hZGVkIGluIHRoZSBob3N0IGtlcm5lbCB0byBwcm92aWRlIEFGX1ZTT0NLCj4gQEAg
LTU3LDYgKzU4LDcgQEAgY29uZmlnIFZIT1NUX1ZEUEEKPiAgIAl0cmlzdGF0ZSAiVmhvc3QgZHJp
dmVyIGZvciB2RFBBLWJhc2VkIGJhY2tlbmQiCj4gICAJZGVwZW5kcyBvbiBFVkVOVEZECj4gICAJ
c2VsZWN0IFZEUEEKPiArCXNlbGVjdCBWSE9TVAo+ICAgCWhlbHAKPiAgIAkgIFRoaXMga2VybmVs
IG1vZHVsZSBjYW4gYmUgbG9hZGVkIGluIGhvc3Qga2VybmVsIHRvIGFjY2VsZXJhdGUKPiAgIAkg
IGd1ZXN0IHZpcnRpbyBkZXZpY2VzIHdpdGggdGhlIHZEUEEtYmFzZWQgYmFja2VuZHMuCj4gQEAg
LTc4LDUgKzgwLDMgQEAgY29uZmlnIFZIT1NUX0NST1NTX0VORElBTl9MRUdBQ1kKPiAgIAkgIGFk
ZHMgc29tZSBvdmVyaGVhZCwgaXQgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdC4KPiAgIAo+ICAgCSAg
SWYgdW5zdXJlLCBzYXkgIk4iLgo+IC0KPiAtZW5kaWYKPgo+Cj4gQnV0IG5vdyBDT05GSUdfVkhP
U1QgaXMgYWx3YXlzICJ5IiwgbmV2ZXIgIm0iLgo+IFdoaWNoIEkgdGhpbmsgd2lsbCBtYWtlIGl0
IGEgYnVpbHQtaW4uCj4gRGlkbid0IGZpZ3VyZSBvdXQgd2h5IHlldC4KCgpJcyBpdCBiZWNhdXNl
IHRoZSBkZXBlbmRlbmN5IG9mIEVWRU5URkQgZm9yIENPTkZJR19WSE9TVD8KClJlbW92ZSB0aGF0
IG9uZSBmb3IgdGhpcyBwYXRjaCwgSSBjYW4gZ2V0IENPTkZJR19WSE9TVD1tLgoKQnV0IGFjY29y
ZGluZyB0byBkb2N1bWVudGF0aW9uL2tidWlsZC9rY29uZmlnLnJzdCwgc2VsZWN0IGlzIHVzZWQg
Zm9yIApvcHRpb24gd2l0aG91dCBwcm9tcHQuCgpUaGFua3MKCgo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
