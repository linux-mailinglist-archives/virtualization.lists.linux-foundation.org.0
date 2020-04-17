Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FEE1AD9CA
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 11:25:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9FE9F87620;
	Fri, 17 Apr 2020 09:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3OU-Hm7h0xkR; Fri, 17 Apr 2020 09:25:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0490787652;
	Fri, 17 Apr 2020 09:25:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB005C0172;
	Fri, 17 Apr 2020 09:25:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC6B6C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DBE5C85EBE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MACz4-QAFNic
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:25:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 11C4C85D72
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:25:36 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id q204so1500291oia.13
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 02:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BWSTE4N/Wm9rwAUVp1UnC1E/i0r+ahDeY0nVMk2tI18=;
 b=rMLe895ImTVU42lJcAkQiw3/O7LRShEW5RV7F/ZEP9TaZ39lzTREkJRvKVSAHZqChK
 afx0m3WOcUUrrrtBuJOA0I88PPvWSi8cEnBtFt3dtB6MowcYk10FOVnvmn3EYmc3eEe2
 LKV7IscSCBGrqZndYnbjZ4KsIOfTNQJNIsqqx1rdI7/GbvrwtBaEXknO51l6geJIw3sC
 bVYluyyTHW8QbaCF/emdO6f3l9CZdo6d7YXH4U2Tcu4RMTif2Q32762CI294bl0bUjOY
 MJ0dqK8/gQd7Zt25ONRUHQUa+PKTJgpQ8hRJzYVuAkgqLdVmni3gNaIuANApg+OKPdvQ
 O9rw==
X-Gm-Message-State: AGi0PubjIRIOytz/iXeSDdiT9b7RdeQbJVvIw0oSlW9EzfO68YrKXICg
 +6vppuhfbY1Rhe/489y9xDibgTV70cvUkbk36As=
X-Google-Smtp-Source: APiQypKOQv5qC1afvAW43RZ+soR2wpbEzQicoJCcDz/ilWYKQxCgXhQrGiZnQcdr5oL9NLxkkPtHOBZ4kMwMNNnvFv8=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr1412099oig.153.1587115535289; 
 Fri, 17 Apr 2020 02:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
 <20200417042912-mutt-send-email-mst@kernel.org>
 <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
 <20200417044230-mutt-send-email-mst@kernel.org>
 <73843240-3040-655d-baa9-683341ed4786@redhat.com>
 <20200417045454-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200417045454-mutt-send-email-mst@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Apr 2020 11:25:23 +0200
Message-ID: <CAMuHMdXbzd9puG6gGri4jUtUT8rFrqnWwZ1NwP=47WQJ_eBC5g@mail.gmail.com>
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vasily Gorbik <gor@linux.ibm.com>, KVM list <kvm@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 virtualization@lists.linux-foundation.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

SGkgTWljaGFlbCwKCk9uIEZyaSwgQXByIDE3LCAyMDIwIGF0IDEwOjU3IEFNIE1pY2hhZWwgUy4g
VHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+IHdyb3RlOgo+IE9uIEZyaSwgQXByIDE3LCAyMDIwIGF0
IDA0OjUxOjE5UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiBPbiAyMDIwLzQvMTcg5LiL
5Y2INDo0NiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+ID4gPiBPbiBGcmksIEFwciAxNywg
MjAyMCBhdCAwNDozOTo0OVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+IE9uIDIw
MjAvNC8xNyDkuIvljYg0OjI5LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gPiA+ID4gPiBP
biBGcmksIEFwciAxNywgMjAyMCBhdCAwMzozNjo1MlBNICswODAwLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+ID4gPiA+ID4gPiBPbiAyMDIwLzQvMTcg5LiL5Y2IMjozMywgTWljaGFlbCBTLiBUc2lya2lu
IHdyb3RlOgo+ID4gPiA+ID4gPiA+IE9uIEZyaSwgQXByIDE3LCAyMDIwIGF0IDExOjEyOjE0QU0g
KzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiBPbiAyMDIwLzQvMTcg5LiK
5Y2INjo1NSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gPiBPbiBX
ZWQsIEFwciAxNSwgMjAyMCBhdCAxMDo0Mzo1NkFNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
ID4gPiA+ID4gPiA+ID4gPiA+IFdlIHRyeSB0byBrZWVwIHRoZSBkZWZjb25maWcgdW50b3VjaGVk
IGFmdGVyIGRlY291cGxpbmcgQ09ORklHX1ZIT1NUCj4gPiA+ID4gPiA+ID4gPiA+ID4gb3V0IG9m
IENPTkZJR19WSVJUVUFMSVpBVElPTiBpbiBjb21taXQgMjBjMzg0ZjFlYTFhCj4gPiA+ID4gPiA+
ID4gPiA+ID4gKCJ2aG9zdDogcmVmaW5lIHZob3N0IGFuZCB2cmluZ2gga2NvbmZpZyIpIGJ5IGVu
YWJsaW5nIFZIT1NUX01FTlUgYnkKPiA+ID4gPiA+ID4gPiA+ID4gPiBkZWZhdWx0LiBUaGVuIHRo
ZSBkZWZjb25maWdzIGNhbiBrZWVwIGVuYWJsaW5nIENPTkZJR19WSE9TVF9ORVQKPiA+ID4gPiA+
ID4gPiA+ID4gPiB3aXRob3V0IHRoZSBjYXJpbmcgb2YgQ09ORklHX1ZIT1NULgo+ID4gPiA+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gQnV0IHRoaXMgd2lsbCBsZWF2ZSBhICJDT05G
SUdfVkhPU1RfTUVOVT15IiBpbiBhbGwgZGVmY29uZmlncyBhbmQgZXZlbgo+ID4gPiA+ID4gPiA+
ID4gPiA+IGZvciB0aGUgb25lcyB0aGF0IGRvZXNuJ3Qgd2FudCB2aG9zdC4gU28gaXQgYWN0dWFs
bHkgc2hpZnRzIHRoZQo+ID4gPiA+ID4gPiA+ID4gPiA+IGJ1cmRlbnMgdG8gdGhlIG1haW50YWlu
ZXJzIG9mIGFsbCBvdGhlciB0byBhZGQgIkNPTkZJR19WSE9TVF9NRU5VIGlzCj4gPiA+ID4gPiA+
ID4gPiA+ID4gbm90IHNldCIuIFNvIHRoaXMgcGF0Y2ggdHJpZXMgdG8gZW5hYmxlIENPTkZJR19W
SE9TVCBleHBsaWNpdGx5IGluCj4gPiA+ID4gPiA+ID4gPiA+ID4gZGVmY29uZmlncyB0aGF0IGVu
YWJsZXMgQ09ORklHX1ZIT1NUX05FVCBhbmQgQ09ORklHX1ZIT1NUX1ZTT0NLLgo+ID4gPiA+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gQWNrZWQtYnk6IENocmlzdGlhbiBCb3JudHJh
ZWdlcjxib3JudHJhZWdlckBkZS5pYm0uY29tPiAgIChzMzkwKQo+ID4gPiA+ID4gPiA+ID4gPiA+
IEFja2VkLWJ5OiBNaWNoYWVsIEVsbGVybWFuPG1wZUBlbGxlcm1hbi5pZC5hdT4gICAocG93ZXJw
YykKPiA+ID4gPiA+ID4gPiA+ID4gPiBDYzogVGhvbWFzIEJvZ2VuZG9lcmZlcjx0c2JvZ2VuZEBh
bHBoYS5mcmFua2VuLmRlPgo+ID4gPiA+ID4gPiA+ID4gPiA+IENjOiBCZW5qYW1pbiBIZXJyZW5z
Y2htaWR0PGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz4KPiA+ID4gPiA+ID4gPiA+ID4gPiBDYzog
UGF1bCBNYWNrZXJyYXM8cGF1bHVzQHNhbWJhLm9yZz4KPiA+ID4gPiA+ID4gPiA+ID4gPiBDYzog
TWljaGFlbCBFbGxlcm1hbjxtcGVAZWxsZXJtYW4uaWQuYXU+Cj4gPiA+ID4gPiA+ID4gPiA+ID4g
Q2M6IEhlaWtvIENhcnN0ZW5zPGhlaWtvLmNhcnN0ZW5zQGRlLmlibS5jb20+Cj4gPiA+ID4gPiA+
ID4gPiA+ID4gQ2M6IFZhc2lseSBHb3JiaWs8Z29yQGxpbnV4LmlibS5jb20+Cj4gPiA+ID4gPiA+
ID4gPiA+ID4gQ2M6IENocmlzdGlhbiBCb3JudHJhZWdlcjxib3JudHJhZWdlckBkZS5pYm0uY29t
Pgo+ID4gPiA+ID4gPiA+ID4gPiA+IFJlcG9ydGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW48Z2Vl
cnRAbGludXgtbTY4ay5vcmc+Cj4gPiA+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFz
b24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+ID4gPiA+ID4gPiA+ID4gPiBJIHJlYmFzZWQg
dGhpcyBvbiB0b3Agb2YgT0FCSSBmaXggc2luY2UgdGhhdAo+ID4gPiA+ID4gPiA+ID4gPiBzZWVt
cyBtb3JlIG9yZ2VudCB0byBmaXguCj4gPiA+ID4gPiA+ID4gPiA+IFB1c2hlZCB0byBteSB2aG9z
dCBicmFuY2ggcGxzIHRha2UgYSBsb29rIGFuZAo+ID4gPiA+ID4gPiA+ID4gPiBpZiBwb3NzaWJs
ZSB0ZXN0Lgo+ID4gPiA+ID4gPiA+ID4gPiBUaGFua3MhCj4gPiA+ID4gPiA+ID4gPiBJIHRlc3Qg
dGhpcyBwYXRjaCBieSBnZW5lcmF0aW5nIHRoZSBkZWZjb25maWdzIHRoYXQgd2FudHMgdmhvc3Rf
bmV0IG9yCj4gPiA+ID4gPiA+ID4gPiB2aG9zdF92c29jay4gQWxsIGxvb2tzIGZpbmUuCj4gPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gQnV0IGhhdmluZyBDT05GSUdfVkhPU1RfRFBOPXkg
bWF5IGVuZCB1cCB3aXRoIHRoZSBzaW1pbGFyIHNpdHVhdGlvbiB0aGF0Cj4gPiA+ID4gPiA+ID4g
PiB0aGlzIHBhdGNoIHdhbnQgdG8gYWRkcmVzcy4KPiA+ID4gPiA+ID4gPiA+IE1heWJlIHdlIGNh
biBsZXQgQ09ORklHX1ZIT1NUIGRlcGVuZHMgb24gIUFSTSB8fCBBRUFCSSB0aGVuIGFkZCBhbm90
aGVyCj4gPiA+ID4gPiA+ID4gPiBtZW51Y29uZmlnIGZvciBWSE9TVF9SSU5HIGFuZCBkbyBzb21l
dGhpbmcgc2ltaWxhcj8KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBUaGFua3MKPiA+
ID4gPiA+ID4gPiBTb3JyeSBJIGRvbid0IHVuZGVyc3RhbmQuIEFmdGVyIHRoaXMgcGF0Y2ggQ09O
RklHX1ZIT1NUX0RQTiBpcyBqdXN0Cj4gPiA+ID4gPiA+ID4gYW4gaW50ZXJuYWwgdmFyaWFibGUg
Zm9yIHRoZSBPQUJJIGZpeC4gSSBrZXB0IGl0IHNlcGFyYXRlCj4gPiA+ID4gPiA+ID4gc28gaXQn
cyBlYXN5IHRvIHJldmVydCBmb3IgNS44LiBZZXMgd2UgY291bGQgc3F1YXNoIGl0IGludG8KPiA+
ID4gPiA+ID4gPiBWSE9TVCBkaXJlY3RseSBidXQgSSBkb24ndCBzZWUgaG93IHRoYXQgY2hhbmdl
cyBsb2dpYyBhdCBhbGwuCj4gPiA+ID4gPiA+IFNvcnJ5IGZvciBiZWluZyB1bmNsZWFyLgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBJIG1lYW50IHNpbmNlIGl0IHdhcyBlbmFibGVkIGJ5IGRlZmF1
bHQsICJDT05GSUdfVkhPU1RfRFBOPXkiIHdpbGwgYmUgbGVmdAo+ID4gPiA+ID4gPiBpbiB0aGUg
ZGVmY29uZmlncy4KPiA+ID4gPiA+IEJ1dCB3aG8gY2FyZXM/Cj4gPiA+ID4gRllJLCBwbGVhc2Ug
c2VlaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMva3ZtL21zZzIxMjY4NS5odG1sCj4gPiA+
IFRoZSBjb21wbGFpbnQgd2FzIG5vdCBhYm91dCB0aGUgc3ltYm9sIElJVUMuICBJdCB3YXMgdGhh
dCB3ZSBjYXVzZWQKPiA+ID4gZXZlcnlvbmUgdG8gYnVpbGQgdmhvc3QgdW5sZXNzIHRoZXkgbWFu
dWFsbHkgZGlzYWJsZWQgaXQuCj4gPgo+ID4gVGhlcmUgY291bGQgYmUgc29tZSBtaXN1bmRlcnN0
YW5kaW5nIGhlcmUuIEkgdGhvdWdodCBpdCdzIHNvbWVob3cgc2ltaWxhcjogYQo+ID4gQ09ORklH
X1ZIT1NUX01FTlU9eSB3aWxsIGJlIGxlZnQgaW4gdGhlIGRlZmNvbmZpZ3MgZXZlbiBpZiBDT05G
SUdfVkhPU1QgaXMKPiA+IG5vdCBzZXQuCj4gPgo+ID4gVGhhbmtzCj4KPiBIbW0uIFNvIGxvb2tp
bmcgYXQgRG9jdW1lbnRhdGlvbi9rYnVpbGQva2NvbmZpZy1sYW5ndWFnZS5yc3QgOgo+Cj4gICAg
ICAgICBUaGluZ3MgdGhhdCBtZXJpdCAiZGVmYXVsdCB5L20iIGluY2x1ZGU6Cj4KPiAgICAgICAg
IGEpIEEgbmV3IEtjb25maWcgb3B0aW9uIGZvciBzb21ldGhpbmcgdGhhdCB1c2VkIHRvIGFsd2F5
cyBiZSBidWlsdAo+ICAgICAgICAgICAgc2hvdWxkIGJlICJkZWZhdWx0IHkiLgo+Cj4gICAgICAg
ICBiKSBBIG5ldyBnYXRla2VlcGluZyBLY29uZmlnIG9wdGlvbiB0aGF0IGhpZGVzL3Nob3dzIG90
aGVyIEtjb25maWcKPiAgICAgICAgICAgIG9wdGlvbnMgKGJ1dCBkb2VzIG5vdCBnZW5lcmF0ZSBh
bnkgY29kZSBvZiBpdHMgb3duKSwgc2hvdWxkIGJlCj4gICAgICAgICAgICAiZGVmYXVsdCB5IiBz
byBwZW9wbGUgd2lsbCBzZWUgdGhvc2Ugb3RoZXIgb3B0aW9ucy4KPgo+ICAgICAgICAgYykgU3Vi
LWRyaXZlciBiZWhhdmlvciBvciBzaW1pbGFyIG9wdGlvbnMgZm9yIGEgZHJpdmVyIHRoYXQgaXMK
PiAgICAgICAgICAgICJkZWZhdWx0IG4iLiBUaGlzIGFsbG93cyB5b3UgdG8gcHJvdmlkZSBzYW5l
IGRlZmF1bHRzLgo+Cj4KPiBTbyBpdCBsb29rcyBsaWtlIFZIT1NUX01FTlUgaXMgYWN0dWFsbHkg
bWF0Y2hpbmcgcnVsZSBiKS4KPiBTbyB3aGF0J3MgdGhlIHByb2JsZW0gd2UgYXJlIHRyeWluZyB0
byBzb2x2ZSB3aXRoIHRoaXMgcGF0Y2gsIGV4YWN0bHk/Cj4KPiBHZWVydCBjb3VsZCB5b3UgY2xh
cmlmeSBwbHM/CgpJIGNhbiBjb25maXJtIFZIT1NUX01FTlUgaXMgbWF0Y2hpbmcgcnVsZSBiKSwg
c28gaXQgaXMgc2FmZSB0byBhbHdheXMKZW5hYmxlIGl0LgoKR3J7b2V0amUsZWV0aW5nfXMsCgog
ICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcK
CkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwg
bXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1
c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
