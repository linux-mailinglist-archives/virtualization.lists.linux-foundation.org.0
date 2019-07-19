Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB946E2A1
	for <lists.virtualization@lfdr.de>; Fri, 19 Jul 2019 10:39:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 29987238A;
	Fri, 19 Jul 2019 08:39:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 911F42203
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 08:39:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CF122F8
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 08:39:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so31407256wrr.5
	for <virtualization@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 01:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=IwlDXaMcxvc69QTHdN/yDtvOyRXHjJlcOStxihQIiDQ=;
	b=Q1OTsoMj8WiPKnbq8hEFNZCMXpBl2phdfFiw1sXtb9jYeR/u0hUeYZ0B1vA55funr/
	oViTABxJEq8sj+WmJl5Oa3NFe4G8YWPcb4oj2QbTUFqDT+hApDsLgRgrn7eN8VMfyFWW
	6g/ScK6eZxFXrD4CvNua31l09vzOXUVl33516QZz8mrbrErBV9wILzufMsogbDzxvXGx
	tY407e6dCBqBoWYqWUSSrLR6aECMknpEpmmxe5sdkjpTJgLNwqQGmOdXVEUGccX9WSA8
	czSctmhRlyFx7kDytCxLKlfiZ09XW4thg4ocAAltxlqYTblNNI3FcA4De3IQnqY0IwMf
	S+/g==
X-Gm-Message-State: APjAAAXy9swnvJCilUErwEYWrVodH27Dm6GFlNn79qEZGK7apEQlsep7
	Z0ur5WaeCJFGONPQMJ4EwLjasQ==
X-Google-Smtp-Source: APXvYqy6OgjWX0aTzdcwajygZXtSOmc92S4v6gvfaOlaRCqlkjASY/2FESso9SndeM0QYmswQT40Aw==
X-Received: by 2002:adf:e50c:: with SMTP id j12mr50617307wrm.117.1563525563378;
	Fri, 19 Jul 2019 01:39:23 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
	[79.13.201.122])
	by smtp.gmail.com with ESMTPSA id c1sm58860105wrh.1.2019.07.19.01.39.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 01:39:22 -0700 (PDT)
Date: Fri, 19 Jul 2019 10:39:20 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 4/5] vhost/vsock: split packets to send using multiple
	buffers
Message-ID: <20190719083920.67qo2umpthz454be@steredhat>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-5-sgarzare@redhat.com>
	<20190717105336-mutt-send-email-mst@kernel.org>
	<CAGxU2F45v40qAOHkm1Hk2E69gCS0UwVgS5NS+tDXXuzdF4EixA@mail.gmail.com>
	<20190718041234-mutt-send-email-mst@kernel.org>
	<CAGxU2F6oo7Cou7t9o=gG2=wxHMKX9xYQXNxVtDYeHq5fyEhJWg@mail.gmail.com>
	<20190718072741-mutt-send-email-mst@kernel.org>
	<20190719080832.7hoeus23zjyrx3cc@steredhat>
	<fcd19719-e5a9-adad-1e6c-c84487187088@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fcd19719-e5a9-adad-1e6c-c84487187088@redhat.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDQ6MjE6NTJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzcvMTkg5LiL5Y2INDowOCwgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3Rl
Ogo+ID4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDc6MzU6NDZBTSAtMDQwMCwgTWljaGFlbCBT
LiBUc2lya2luIHdyb3RlOgo+ID4gPiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCAxMTozNzozMEFN
ICswMjAwLCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCBKdWwgMTgs
IDIwMTkgYXQgMTA6MTMgQU0gTWljaGFlbCBTLiBUc2lya2luPG1zdEByZWRoYXQuY29tPiAgd3Jv
dGU6Cj4gPiA+ID4gPiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCAwOTo1MDoxNEFNICswMjAwLCBT
dGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFdlZCwgSnVsIDE3LCAyMDE5
IGF0IDQ6NTUgUE0gTWljaGFlbCBTLiBUc2lya2luPG1zdEByZWRoYXQuY29tPiAgd3JvdGU6Cj4g
PiA+ID4gPiA+ID4gT24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDE6MzA6MjlQTSArMDIwMCwgU3Rl
ZmFubyBHYXJ6YXJlbGxhIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gSWYgdGhlIHBhY2tldHMgdG8g
c2VudCB0byB0aGUgZ3Vlc3QgYXJlIGJpZ2dlciB0aGFuIHRoZSBidWZmZXIKPiA+ID4gPiA+ID4g
PiA+IGF2YWlsYWJsZSwgd2UgY2FuIHNwbGl0IHRoZW0sIHVzaW5nIG11bHRpcGxlIGJ1ZmZlcnMg
YW5kIGZpeGluZwo+ID4gPiA+ID4gPiA+ID4gdGhlIGxlbmd0aCBpbiB0aGUgcGFja2V0IGhlYWRl
ci4KPiA+ID4gPiA+ID4gPiA+IFRoaXMgaXMgc2FmZSBzaW5jZSB2aXJ0aW8tdnNvY2sgc3VwcG9y
dHMgb25seSBzdHJlYW0gc29ja2V0cy4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogU3RlZmFubyBHYXJ6YXJlbGxhPHNnYXJ6YXJlQHJlZGhhdC5jb20+Cj4g
PiA+ID4gPiA+ID4gU28gaG93IGRvZXMgaXQgd29yayByaWdodCBub3c/IElmIGFuIGFwcAo+ID4g
PiA+ID4gPiA+IGRvZXMgc2VuZG1zZyB3aXRoIGEgNjRLIGJ1ZmZlciBhbmQgdGhlIG90aGVyCj4g
PiA+ID4gPiA+ID4gc2lkZSBwdWJsaXNoZXMgNEsgYnVmZmVycyAtIGRvZXMgaXQganVzdCBzdGFs
bD8KPiA+ID4gPiA+ID4gQmVmb3JlIHRoaXMgc2VyaWVzLCB0aGUgNjRLIChvciBiaWdnZXIpIHVz
ZXIgbWVzc2FnZXMgd2FzIHNwbGl0IGluIDRLIHBhY2tldHMKPiA+ID4gPiA+ID4gKGZpeGVkIGlu
IHRoZSBjb2RlKSBhbmQgcXVldWVkIGluIGFuIGludGVybmFsIGxpc3QgZm9yIHRoZSBUWCB3b3Jr
ZXIuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBBZnRlciB0aGlzIHNlcmllcywgd2Ugd2lsbCBx
dWV1ZSB1cCB0byA2NEsgcGFja2V0cyBhbmQgdGhlbiBpdCB3aWxsIGJlIHNwbGl0IGluCj4gPiA+
ID4gPiA+IHRoZSBUWCB3b3JrZXIsIGRlcGVuZGluZyBvbiB0aGUgc2l6ZSBvZiB0aGUgYnVmZmVy
cyBhdmFpbGFibGUgaW4gdGhlCj4gPiA+ID4gPiA+IHZyaW5nLiAoVGhlIGlkZWEgd2FzIHRvIGFs
bG93IEVXTUEgb3IgYSBjb25maWd1cmF0aW9uIG9mIHRoZSBidWZmZXJzIHNpemUsIGJ1dAo+ID4g
PiA+ID4gPiBmb3Igbm93IHdlIHBvc3Rwb25lZCBpdCkKPiA+ID4gPiA+IEdvdCBpdC4gVXNpbmcg
d29ya2VycyBmb3IgeG1pdCBpcyBJTUhPIGEgYmFkIGlkZWEgYnR3Lgo+ID4gPiA+ID4gV2h5IGlz
IGl0IGRvbmUgbGlrZSB0aGlzPwo+ID4gPiA+IEhvbmVzdGx5LCBJIGRvbid0IGtub3cgdGhlIGV4
YWN0IHJlYXNvbnMgZm9yIHRoaXMgZGVzaWduLCBidXQgSSBzdXBwb3NlCj4gPiA+ID4gdGhhdCB0
aGUgaWRlYSB3YXMgdG8gaGF2ZSBvbmx5IG9uZSB3b3JrZXIgdGhhdCB1c2VzIHRoZSB2cmluZywg
YW5kCj4gPiA+ID4gbXVsdGlwbGUgdXNlciB0aHJlYWRzIHRoYXQgZW5xdWV1ZSBwYWNrZXRzIGlu
IHRoZSBsaXN0Lgo+ID4gPiA+IFRoaXMgY2FuIHNpbXBsaWZ5IHRoZSBjb2RlIGFuZCB3ZSBjYW4g
cHV0IHRoZSB1c2VyIHRocmVhZHMgdG8gc2xlZXAgaWYKPiA+ID4gPiB3ZSBkb24ndCBoYXZlICJj
cmVkaXQiIGF2YWlsYWJsZSAodGhpcyBtZWFucyB0aGF0IHRoZSByZWNlaXZlciBkb2Vzbid0Cj4g
PiA+ID4gaGF2ZSBzcGFjZSB0byByZWNlaXZlIHRoZSBwYWNrZXQpLgo+ID4gPiBJIHRoaW5rIHlv
dSBtZWFuIHRoZSByZXZlcnNlOiBldmVuIHdpdGhvdXQgY3JlZGl0cyB5b3UgY2FuIGNvcHkgZnJv
bQo+ID4gPiB1c2VyIGFuZCBxdWV1ZSB1cCBkYXRhLCB0aGVuIHByb2Nlc3MgaXQgd2l0aG91dCB3
YWtpbmcgdXAgdGhlIHVzZXIKPiA+ID4gdGhyZWFkLgo+ID4gSSBjaGVja2VkIHRoZSBjb2RlIGJl
dHRlciwgYnV0IGl0IGRvZXNuJ3Qgc2VlbSB0byBkbyB0aGF0Lgo+ID4gVGhlIC5zZW5kbXNnIGNh
bGxiYWNrIG9mIGFmX3Zzb2NrLCBjaGVjayBpZiB0aGUgdHJhbnNwb3J0IGhhcyBzcGFjZQo+ID4g
KHZpcnRpby12c29jayB0cmFuc3BvcnQgcmV0dXJucyB0aGUgY3JlZGl0IGF2YWlsYWJsZSkuIElm
IHRoZXJlIGlzIG5vCj4gPiBzcGFjZSwgaXQgcHV0IHRoZSB0aHJlYWQgdG8gc2xlZXAgb24gdGhl
ICdza19zbGVlcChzayknIHdhaXRfcXVldWUuCj4gPiAKPiA+IFdoZW4gdGhlIHRyYW5zcG9ydCBy
ZWNlaXZlcyBhbiB1cGRhdGUgb2YgY3JlZGl0IGF2YWlsYWJsZSBvbiB0aGUgb3RoZXIKPiA+IHBl
ZXIsIGl0IGNhbGxzICdzay0+c2tfd3JpdGVfc3BhY2Uoc2spJyB0aGF0IHdha2VzIHVwIHRoZSB0
aHJlYWQKPiA+IHNsZWVwaW5nLCB0aGF0IHdpbGwgcXVldWUgdGhlIG5ldyBwYWNrZXQuCj4gPiAK
PiA+IFNvLCBpbiB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiwgdGhlIFRYIHdvcmtlciBkb2Vz
bid0IGNoZWNrIHRoZQo+ID4gY3JlZGl0IGF2YWlsYWJsZSwgaXQgb25seSBzZW5kcyB0aGUgcGFj
a2V0cy4KPiA+IAo+ID4gPiBEb2VzIGl0IGhlbHAgdGhvdWdoPyBJdCBjZXJ0YWlubHkgYWRkcyB1
cCB3b3JrIG91dHNpZGUgb2YKPiA+ID4gdXNlciB0aHJlYWQgY29udGV4dCB3aGljaCBtZWFucyBp
dCdzIG5vdCBhY2NvdW50ZWQgZm9yCj4gPiA+IGNvcnJlY3RseS4KPiA+IEkgY2FuIHRyeSB0byB4
bWl0IHRoZSBwYWNrZXQgZGlyZWN0bHkgaW4gdGhlIHVzZXIgdGhyZWFkIGNvbnRleHQsIHRvIHNl
ZQo+ID4gdGhlIGltcHJvdmVtZW50cy4KPiAKPiAKPiBJdCB3aWxsIHRoZW4gbG9va3MgbW9yZSBs
aWtlIHdoYXQgdmlydGlvLW5ldCAoYW5kIG90aGVyIG5ldHdvcmtpbmcgZGV2aWNlKQo+IGRpZC4K
CkknbGwgdHJ5IEFTQVAsIHRoZSBjaGFuZ2VzIHNob3VsZCBub3QgYmUgdG9vIGNvbXBsaWNhdGVk
Li4uIEkgaG9wZSA6KQoKPiAKPiAKPiA+IAo+ID4gPiBNYXliZSB3ZSB3YW50IG1vcmUgVlFzLiBX
b3VsZCBoZWxwIGltcHJvdmUgcGFyYWxsZWxpc20uIFRoZSBxdWVzdGlvbgo+ID4gPiB3b3VsZCB0
aGVuIGJlY29tZSBob3cgdG8gbWFwIHNvY2tldHMgdG8gVlFzLiBXaXRoIGEgc2ltcGxlIGhhc2gK
PiA+ID4gaXQncyBlYXN5IHRvIGNyZWF0ZSBjb2xsaXNpb25zIC4uLgo+ID4gWWVzLCBtb3JlIFZR
cyBjYW4gaGVscCBidXQgdGhlIG1hcCBxdWVzdGlvbiBpcyBub3Qgc2ltcGxlIHRvIGFuc3dlci4K
PiA+IE1heWJlIHdlIGNhbiBkbyBhbiBoYXNoIG9uIHRoZSAoY2lkLCBwb3J0KSBvciBkbyBzb21l
IGtpbmQgb2YgZXN0aW1hdGlvbgo+ID4gb2YgcXVldWUgdXRpbGl6YXRpb24gYW5kIHRyeSB0byBi
YWxhbmNlLgo+ID4gU2hvdWxkIHRoZSBtYXBwaW5nIGJlIHVuaXF1ZT8KPiAKPiAKPiBJdCBzb3Vu
ZHMgdG8gbWUgeW91IHdhbnQgc29tZSBraW5kIG9mIGZhaXIgcXVldWluZz8gV2UndmUgYWxyZWFk
eSBoYWQKPiBzZXZlcmFsIHFkaXNjcyB0aGF0IGRvIHRoaXMuCgpUaGFua3MgZm9yIHBvaW50aW5n
IGl0IG91dCEKCj4gCj4gU28gaWYgd2UgdXNlIHRoZSBrZXJuZWwgbmV0d29ya2luZyB4bWl0IHBh
dGgsIGFsbCB0aG9zZSBpc3N1ZXMgY291bGQgYmUKPiBhZGRyZXNzZWQuCgpPbmUgbW9yZSBwb2lu
dCB0byBBRl9WU09DSyArIG5ldC1zdGFjaywgYnV0IHdlIGhhdmUgdG8gZXZhbHVhdGUgcG9zc2li
bGUKZHJhd2JhY2tzIGluIHVzaW5nIHRoZSBuZXQtc3RhY2suIChlLmcuIG1vcmUgbGF0ZW5jeSBk
dWUgdG8gdGhlIGNvbXBsZXhpdHkKb2YgdGhlIG5ldC1zdGFjaz8pCgpUaGFua3MsClN0ZWZhbm8K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
