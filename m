Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9FF6D91E
	for <lists.virtualization@lfdr.de>; Fri, 19 Jul 2019 04:37:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7C7122159;
	Fri, 19 Jul 2019 02:37:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0E3822156
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 02:37:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8BB0AB0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 02:37:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D562530C1330;
	Fri, 19 Jul 2019 02:37:03 +0000 (UTC)
Received: from [10.72.12.179] (ovpn-12-179.pek2.redhat.com [10.72.12.179])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9ACCA60E39;
	Fri, 19 Jul 2019 02:36:54 +0000 (UTC)
Subject: Re: [PATCH] virtio-net: parameterize min ring num_free for virtio
	receive
To: "Michael S. Tsirkin" <mst@redhat.com>, ? jiang <jiangkidd@hotmail.com>
References: <BYAPR14MB32056583C4963342F5D817C4A6C80@BYAPR14MB3205.namprd14.prod.outlook.com>
	<20190718085836-mutt-send-email-mst@kernel.org>
	<bdd30ef5-4f69-8218-eed0-38c6daac42db@redhat.com>
	<20190718103641-mutt-send-email-mst@kernel.org>
	<20190718104307-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d1faa33a-6c4c-1190-8430-f0639edc3b96@redhat.com>
Date: Fri, 19 Jul 2019 10:36:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718104307-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 19 Jul 2019 02:37:04 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
	"songliubraving@fb.com" <songliubraving@fb.com>,
	"jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
	"hawk@kernel.org" <hawk@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"jiangran.jr@alibaba-inc.com" <jiangran.jr@alibaba-inc.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>,
	"ast@kernel.org" <ast@kernel.org>, "kafai@fb.com" <kafai@fb.com>,
	"yhs@fb.com" <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvNy8xOCDkuIvljYgxMDo0MywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IE9u
IFRodSwgSnVsIDE4LCAyMDE5IGF0IDEwOjQyOjQ3QU0gLTA0MDAsIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToKPj4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMTA6MDE6MDVQTSArMDgwMCwgSmFz
b24gV2FuZyB3cm90ZToKPj4+IE9uIDIwMTkvNy8xOCDkuIvljYg5OjA0LCBNaWNoYWVsIFMuIFRz
aXJraW4gd3JvdGU6Cj4+Pj4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMTI6NTU6NTBQTSArMDAw
MCwgPyBqaWFuZyB3cm90ZToKPj4+Pj4gVGhpcyBjaGFuZ2UgbWFrZXMgcmluZyBidWZmZXIgcmVj
bGFpbSB0aHJlc2hvbGQgbnVtX2ZyZWUgY29uZmlndXJhYmxlCj4+Pj4+IGZvciBiZXR0ZXIgcGVy
Zm9ybWFuY2UsIHdoaWxlIGl0J3MgaGFyZCBjb2RlZCBhcyAxLzIgKiBxdWV1ZSBub3cuCj4+Pj4+
IEFjY29yZGluZyB0byBvdXIgdGVzdCB3aXRoIHFlbXUgKyBkcGRrLCBwYWNrZXQgZHJvcHBpbmcg
aGFwcGVucyB3aGVuCj4+Pj4+IHRoZSBndWVzdCBpcyBub3QgYWJsZSB0byBwcm92aWRlIGZyZWUg
YnVmZmVyIGluIGF2YWlsIHJpbmcgdGltZWx5Lgo+Pj4+PiBTbWFsbGVyIHZhbHVlIG9mIG51bV9m
cmVlIGRvZXMgZGVjcmVhc2UgdGhlIG51bWJlciBvZiBwYWNrZXQgZHJvcHBpbmcKPj4+Pj4gZHVy
aW5nIG91ciB0ZXN0IGFzIGl0IG1ha2VzIHZpcnRpb19uZXQgcmVjbGFpbSBidWZmZXIgZWFybGll
ci4KPj4+Pj4KPj4+Pj4gQXQgbGVhc3QsIHdlIHNob3VsZCBsZWF2ZSB0aGUgdmFsdWUgY2hhbmdl
YWJsZSB0byB1c2VyIHdoaWxlIHRoZQo+Pj4+PiBkZWZhdWx0IHZhbHVlIGFzIDEvMiAqIHF1ZXVl
IGlzIGtlcHQuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IGppYW5na2lkZDxqaWFuZ2tpZGRA
aG90bWFpbC5jb20+Cj4+Pj4gVGhhdCB3b3VsZCBiZSBvbmUgcmVhc29uLCBidXQgSSBzdXNwZWN0
IGl0J3Mgbm90IHRoZQo+Pj4+IHRydWUgb25lLiBJZiB5b3UgbmVlZCBtb3JlIGJ1ZmZlciBkdWUg
dG8gaml0dGVyCj4+Pj4gdGhlbiBqdXN0IGluY3JlYXNlIHRoZSBxdWV1ZSBzaXplLiBXb3VsZCBi
ZSBjbGVhbmVyLgo+Pj4+Cj4+Pj4KPj4+PiBIb3dldmVyIGFyZSB5b3Ugc3VyZSB0aGlzIGlzIHRo
ZSByZWFzb24gZm9yCj4+Pj4gcGFja2V0IGRyb3BzPyBEbyB5b3Ugc2VlIHRoZW0gZHJvcHBlZCBi
eSBkcGRrCj4+Pj4gZHVlIHRvIGxhY2sgb2Ygc3BhY2UgaW4gdGhlIHJpbmc/IEFzIG9wcG9zZWQg
dG8KPj4+PiBieSBndWVzdD8KPj4+Pgo+Pj4+Cj4+PiBCZXNpZGVzIHRob3NlLCB0aGlzIHBhdGNo
IGRlcGVuZHMgb24gdGhlIHVzZXIgdG8gY2hvb3NlIGEgc3VpdGFibGUgdGhyZXNob2xkCj4+PiB3
aGljaCBpcyBub3QgZ29vZC4gWW91IG5lZWQgZWl0aGVyIGEgZ29vZCB2YWx1ZSB3aXRoIGRlbW9u
c3RyYXRlZCBudW1iZXJzIG9yCj4+PiBzb21ldGhpbmcgc21hcnRlci4KPj4+Cj4+PiBUaGFua3MK
Pj4gSSBkbyBob3dldmVyIHRoaW5rIHRoYXQgd2UgaGF2ZSBhIHByb2JsZW0gcmlnaHQgbm93OiB0
cnlfZmlsbF9yZWN2IGNhbgo+PiB0YWtlIHVwIGEgbG9uZyB0aW1lIGR1cmluZyB3aGljaCBuZXQg
c3RhY2sgZG9lcyBub3QgcnVuIGF0IGFsbC4gSW1hZ2luZQo+PiBhIDFLIHF1ZXVlIC0gd2UgYXJl
IHRhbGtpbmcgNTEyIHBhY2tldHMuIFRoYXQncyBleGNlZXNzaXZlLgoKClllcywgd2Ugd2lsbCBz
dGFydmUgYSBmYXN0IGhvc3QgaW4gdGhpcyBjYXNlLgoKCj4+ICAgIG5hcGkgcG9sbAo+PiB3ZWln
aHQgc29sdmVzIGEgc2ltaWxhciBwcm9ibGVtLCBzbyBpdCBtaWdodCBtYWtlIHNlbnNlIHRvIGNh
cCB0aGlzIGF0Cj4+IG5hcGlfcG9sbF93ZWlnaHQuCj4+Cj4+IFdoaWNoIHdpbGwgYWxsb3cgdHdl
YWtpbmcgaXQgdGhyb3VnaCBhIG1vZHVsZSBwYXJhbWV0ZXIgYXMgYQo+PiBzaWRlIGVmZmVjdCA6
KSBNYXliZSBqdXN0IGRvIE5BUElfUE9MTF9XRUlHSFQuCj4gT3IgbWF5YmUgTkFQSV9QT0xMX1dF
SUdIVC8yIGxpa2Ugd2UgZG8gYXQgaGFsZiB0aGUgcXVldWUgOykuIFBsZWFzZQo+IGV4cGVyaW1l
bnQsIG1lYXN1cmUgcGVyZm9ybWFuY2UgYW5kIGxldCB0aGUgbGlzdCBrbm93Cj4KPj4gTmVlZCB0
byBiZSBjYXJlZnVsIHRob3VnaDogcXVldWVzIGNhbiBhbHNvIGJlIHNtYWxsIGFuZCBJIGRvbid0
IHRoaW5rIHdlCj4+IHdhbnQgdG8gZXhjZWVkIHF1ZXVlIHNpemUgLyAyLCBvciBtYXliZSBxdWV1
ZSBzaXplIC0gbmFwaV9wb2xsX3dlaWdodC4KPj4gRGVmaW5pdGVseSBtdXN0IG5vdCBleGNlZWQg
dGhlIGZ1bGwgcXVldWUgc2l6ZS4KCgpMb29raW5nIGF0IGludGVsLCBpdCB1c2VzIDE2IGFuZCBp
NDBlIHVzZXMgMzIuwqAgSXQgbG9va3MgdG8gbWUgCk5BUElfUE9MTF9XRUlHSFQvMiBpcyBiZXR0
ZXIuCgpKaWFuZywgd2FudCB0byB0cnkgdGhhdCBhbmQgcG9zdCBhIG5ldyBwYXRjaD8KClRoYW5r
cwoKCj4+Cj4+IC0tIAo+PiBNU1QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
