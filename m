Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D78051C6771
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 07:28:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 621E9868D0;
	Wed,  6 May 2020 05:28:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64wf5aqiw6W2; Wed,  6 May 2020 05:28:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 69284868B5;
	Wed,  6 May 2020 05:28:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E365C0859;
	Wed,  6 May 2020 05:28:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3923EC0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 05:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 20A998688C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 05:28:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YkHqADn06qII
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 05:28:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6C3A58688A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 05:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588742898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAw5AwbP2+lICtPzp1Soos0ajccelDLiyAxAMLKNgBk=;
 b=V1dlssJGQTGb9i5BNbYjkP18dIkXRvzXCqld8bZnsetWdz3GDCoiM3ghRsBSxUch7rAyk1
 AdHJ0Q4t52/8KH4pGzww/r0geLwISQClD6k2+tY2mFXz2OkBcSF9+fGAa38JEgJmtFIFWy
 jt4ZA6wBMZrcumbx+oIrKhZaj68L3MM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-ZDFrgaNuMwK1UKtrgmdaAA-1; Wed, 06 May 2020 01:28:16 -0400
X-MC-Unique: ZDFrgaNuMwK1UKtrgmdaAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BB06461;
 Wed,  6 May 2020 05:28:14 +0000 (UTC)
Received: from [10.72.13.165] (ovpn-13-165.pek2.redhat.com [10.72.13.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F50160C18;
 Wed,  6 May 2020 05:28:09 +0000 (UTC)
Subject: Re: [PATCH] virtio_net: fix lockdep warning on 32 bit
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200506000006.196646-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cd6132a6-8dbe-9e7b-2e63-46a9864040e4@redhat.com>
Date: Wed, 6 May 2020 13:28:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506000006.196646-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: netdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <eric.dumazet@gmail.com>,
 virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNS82IOS4iuWNiDg6MDEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBXaGVu
IHdlIGZpbGwgdXAgYSByZWNlaXZlIFZRLCB0cnlfZmlsbF9yZWN2IGN1cnJlbnRseSB0cmllcyB0
byBjb3VudAo+IGtpY2tzIHVzaW5nIGEgNjQgYml0IHN0YXRzIGNvdW50ZXIuIFR1cm5zIG91dCwg
b24gYSAzMiBiaXQga2VybmVsIHRoYXQKPiB1c2VzIGEgc2VxY291bnQuIHNlcXVlbmNlIGNvdW50
cyBhcmUgImxvY2siIGNvbnN0cnVjdHMgd2hlcmUgeW91IG5lZWQgdG8KPiBtYWtlIHN1cmUgdGhh
dCB3cml0ZXJzIGFyZSBzZXJpYWxpemVkLgo+Cj4gSW4gdHVybiwgdGhpcyBtZWFucyB0aGF0IHdl
IG11c3RuJ3QgcnVuIHR3byB0cnlfZmlsbF9yZWN2IGNvbmN1cnJlbnRseS4KPiBXaGljaCBvZiBj
b3Vyc2Ugd2UgZG9uJ3QuIFdlIGRvIHJ1biB0cnlfZmlsbF9yZWN2IHNvbWV0aW1lcyBmcm9tIGEg
ZnVsbHkKPiBwcmVlbXB0aWJsZSBjb250ZXh0IGFuZCBzb21ldGltZXMgZnJvbSBhIHNvZnRpcnEg
KG5hcGkpIGNvbnRleHQuCj4KPiBIb3dldmVyLCB3aGVuIGl0IGNvbWVzIHRvIHRoZSBzZXFjb3Vu
dCwgbG9ja2RlcCBpcyB0cnlpbmcgdG8gZW5mb3JjZQo+IHRoZSBydWxlIHRoYXQgdGhlIHNhbWUg
bG9jayBpc24ndCBhY2Nlc3NlZCBmcm9tIHByZWVtcHRpYmxlCj4gYW5kIHNvZnRpcnEgY29udGV4
dC4gVGhpcyBjYXVzZXMgYSBmYWxzZS1wb3NpdGl2ZSB3YXJuaW5nOgo+Cj4gV0FSTklORzogaW5j
b25zaXN0ZW50IGxvY2sgc3RhdGUKPiAuLi4KPiBpbmNvbnNpc3RlbnQge1NPRlRJUlEtT04tV30g
LT4ge0lOLVNPRlRJUlEtV30gdXNhZ2UuCj4KPiBBcyBhIHdvcmsgYXJvdW5kLCBzaHV0IGRvd24g
dGhlIHdhcm5pbmcgYnkgc3dpdGNoaW5nCj4gdG8gdTY0X3N0YXRzX3VwZGF0ZV9iZWdpbl9pcnFz
YXZlIC0gdGhhdCB3b3JrcyBieSBkaXNhYmxpbmcKPiBpbnRlcnJ1cHRzIG9uIDMyIGJpdCBvbmx5
LCBpcyBhIE5PUCBvbiA2NCBiaXQuCj4KPiBSZXBvcnRlZC1ieTogVGhvbWFzIEdsZWl4bmVyIDx0
Z2x4QGxpbnV0cm9uaXguZGU+Cj4gU3VnZ2VzdGVkLWJ5OiBFcmljIER1bWF6ZXQgPGVyaWMuZHVt
YXpldEBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RA
cmVkaGF0LmNvbT4KPiAtLS0KPgo+IEknbSBub3QgdGhyaWxsZWQgYWJvdXQgdGhpcyBidXQgdGhp
cyBzZWVtcyB0aGUgYmVzdCB3ZSBjYW4gZG8gZm9yIG5vdy4KPgo+IENvbXBsZXRlbHkgdW50ZXN0
ZWQuCj4KPgo+IFRob21hcywgY2FuIHlvdSBwbHMgbGV0IG1lIGtub3cgdGhlIGNvbmZpZyBJIG5l
ZWQgdG8gdHJpZ2dlciB0aGUgd2FybmluZwo+IGluIHF1ZXN0aW9uPwo+Cj4KPiAgIGRyaXZlcnMv
bmV0L3ZpcnRpb19uZXQuYyB8IDYgKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3ZpcnRp
b19uZXQuYyBiL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+IGluZGV4IDY1OTRhYWI0OTEwZS4u
OTUzOTNiNjExODdmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+ICsr
KyBiL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+IEBAIC0xMjQzLDkgKzEyNDMsMTEgQEAgc3Rh
dGljIGJvb2wgdHJ5X2ZpbGxfcmVjdihzdHJ1Y3QgdmlydG5ldF9pbmZvICp2aSwgc3RydWN0IHJl
Y2VpdmVfcXVldWUgKnJxLAo+ICAgCQkJYnJlYWs7Cj4gICAJfSB3aGlsZSAocnEtPnZxLT5udW1f
ZnJlZSk7Cj4gICAJaWYgKHZpcnRxdWV1ZV9raWNrX3ByZXBhcmUocnEtPnZxKSAmJiB2aXJ0cXVl
dWVfbm90aWZ5KHJxLT52cSkpIHsKPiAtCQl1NjRfc3RhdHNfdXBkYXRlX2JlZ2luKCZycS0+c3Rh
dHMuc3luY3ApOwo+ICsJCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gKwo+ICsJCWZsYWdzID0gdTY0
X3N0YXRzX3VwZGF0ZV9iZWdpbl9pcnFzYXZlKCZycS0+c3RhdHMuc3luY3ApOwo+ICAgCQlycS0+
c3RhdHMua2lja3MrKzsKPiAtCQl1NjRfc3RhdHNfdXBkYXRlX2VuZCgmcnEtPnN0YXRzLnN5bmNw
KTsKPiArCQl1NjRfc3RhdHNfdXBkYXRlX2VuZF9pcnFyZXN0b3JlKCZycS0+c3RhdHMuc3luY3Ap
Owo+ICAgCX0KPiAgIAo+ICAgCXJldHVybiAhb29tOwoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxq
YXNvd2FuZ0ByZWRoYXQuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
