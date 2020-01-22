Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CA7144BA4
	for <lists.virtualization@lfdr.de>; Wed, 22 Jan 2020 07:18:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 57E0784415;
	Wed, 22 Jan 2020 06:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCukY73CoPlb; Wed, 22 Jan 2020 06:18:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A622D84397;
	Wed, 22 Jan 2020 06:18:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 843A2C0174;
	Wed, 22 Jan 2020 06:18:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20622C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 06:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0894120778
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 06:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ziqvSW5eqj5S
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 06:18:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id F22152042B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jan 2020 06:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579673905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=46Fyq8DajrI/VyojMmIDzfpBih5cCQHJwjUiK8iJUVM=;
 b=Wn5QGTxLd1d4T+nvQ1/tbd8pOdgc1gV7cxWM7/f5R+P8aM/ai/mzhws4hkncNceXwY8mzQ
 tyDOTyLz8wUCY6NLE13esPXRH87H6Ns8vQyrelWP0QYg5FMNTE7Wd8whb6ox5jkUyM5ert
 kZkPbLwQi36fA8FrqpOlvMGBOJzSd1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-koa7asbiOJCyfjv1xRzSyw-1; Wed, 22 Jan 2020 01:18:24 -0500
X-MC-Unique: koa7asbiOJCyfjv1xRzSyw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED1991902EA0;
 Wed, 22 Jan 2020 06:18:20 +0000 (UTC)
Received: from [10.72.12.103] (ovpn-12-103.pek2.redhat.com [10.72.12.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 957EB5D9E2;
 Wed, 22 Jan 2020 06:18:02 +0000 (UTC)
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
References: <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <d69918ca-8af4-44b2-9652-633530d4c113@redhat.com>
 <20200120174933.GB3891@mellanox.com>
 <2a324cec-2863-58f4-c58a-2414ee32c930@redhat.com>
 <20200121004047-mutt-send-email-mst@kernel.org>
 <b9ad744e-c4cd-82f9-f56a-1ecc185e9cd7@redhat.com>
 <20200121031506-mutt-send-email-mst@kernel.org>
 <20200121140456.GA12330@mellanox.com>
 <20200121091636-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <26fa6211-6625-6dc6-f5df-7a124d8c53ae@redhat.com>
Date: Wed, 22 Jan 2020 14:18:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200121091636-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Rob Miller <rob.miller@broadcom.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 Netdev <netdev@vger.kernel.org>, "Zhu, Lingshan" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvMS8yMSDkuIvljYgxMDoxNywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IE9u
IFR1ZSwgSmFuIDIxLCAyMDIwIGF0IDAyOjA1OjA0UE0gKzAwMDAsIEphc29uIEd1bnRob3JwZSB3
cm90ZToKPj4gT24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMDM6MTU6NDNBTSAtMDUwMCwgTWljaGFl
bCBTLiBUc2lya2luIHdyb3RlOgo+Pj4+IFRoaXMgc291bmRzIG1vcmUgZmxleGlibGUgZS5nIGRy
aXZlciBtYXkgY2hvb3NlIHRvIGltcGxlbWVudCBzdGF0aWMgbWFwcGluZwo+Pj4+IG9uZSB0aHJv
dWdoIGNvbW1pdC4gQnV0IGEgcXVlc3Rpb24gaGVyZSwgaXQgbG9va3MgdG8gbWUgdGhpcyBzdGls
bCByZXF1aXJlcwo+Pj4+IHRoZSBETUEgdG8gYmUgc3luY2VkIHdpdGggYXQgbGVhc3QgY29tbWl0
IGhlcmUuIE90aGVyd2lzZSBkZXZpY2UgbWF5IGdldCBETUEKPj4+PiBmYXVsdD8gT3IgZGV2aWNl
IGlzIGV4cGVjdGVkIHRvIGJlIHBhdXNlZCBETUEgZHVyaW5nIGJlZ2luPwo+Pj4+Cj4+Pj4gVGhh
bmtzCj4+PiBGb3IgZXhhbXBsZSwgY29tbWl0IG1pZ2h0IHN3aXRjaCBvbmUgc2V0IG9mIHRhYmxl
cyBmb3IgYW5vdGhlciwKPj4+IHdpdGhvdXQgbmVlZCB0byBwYXVzZSBETUEuCj4+IEknbSBub3Qg
YXdhcmUgb2YgYW55IGhhcmR3YXJlIHRoYXQgY2FuIGRvIHNvbWV0aGluZyBsaWtlIHRoaXMKPj4g
Y29tcGxldGVseSBhdG9taWNhbGx5Li4KPiBGV0lXIFZURCBjYW4gZG8gdGhpcyBhdG9taWNhbGx5
Lgo+Cj4+IEFueSBtYXBwaW5nIGNoYW5nZSBBUEkgaGFzIHRvIGJlIGJhc2VkIGFyb3VuZCBhZGQv
cmVtb3ZlIHJlZ2lvbnMKPj4gd2l0aG91dCBhbnkgYWN0aXZlIERNQSAoaWUgYWN0aXZlIERNQSBp
cyBhIGd1ZXN0IGVycm9yIHRoZSBndWVzdCBjYW4KPj4gYmUgY3Jhc2hlZCBpZiBpdCBkb2VzIHRo
aXMpCj4+Cj4+IEphc29uCj4gUmlnaHQsIGxvdHMgb2YgY2FzZXMgYXJlIHdlbGwgc2VydmVkIGJ5
IG9ubHkgY2hhbmdpbmcgcGFydHMgb2YKPiBtYXBwaW5nIHRoYXQgYXJlbid0IGluIGFjdGl2ZSB1
c2UuIE1lbW9yeSBob3RwbHVnIGlzIHN1Y2ggYSBjYXNlLgo+IFRoYXQncyBub3QgdGhlIHNhbWUg
YXMgYSBjb21wbGV0ZWx5IHN0YXRpYyBtYXBwaW5nLgoKCkZvciBob3RwbHVnIGl0IHNob3VsZCBi
ZSBmaW5lIHdpdGggY3VycmVudCBRZW11IHNpbmNlIGl0IGJlbG9uZ3MgdG8gCmRpZmZlcmVudCBt
ZW1vcnkgcmVnaW9ucy4gU28gZWFjaCBkaW1tIHNob3VsZCBoYXZlIGl0cyBvd24gZGVkaWNhdGVk
IG1hcCAKZW50cmllcyBpbiBJT01NVS4KCkJ1dCBJJ20gbm90IHN1cmUgaWYgdGhlIG1lcmdpbmcg
bG9naWMgaW4gY3VycmVudCB2aG9zdCBtZW1vcnkgbGlzdGVuZXIgCm1heSBjYXVzZSBhbnkgdHJv
dWJsZSwgd2UgbWF5IG5lZWQgdG8gZGlzYWJsZSBpdC4KClRoYW5rcwoKCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
