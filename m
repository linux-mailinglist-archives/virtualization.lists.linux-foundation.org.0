Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FB97DD91
	for <lists.virtualization@lfdr.de>; Thu,  1 Aug 2019 16:15:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1185725ED;
	Thu,  1 Aug 2019 14:15:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 112F817FE
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 14:15:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 62001E7
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 14:15:15 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id n11so70338097qtl.5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 01 Aug 2019 07:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=is8PyxvRhNytWxsxvai2fZ7Vunv6qUm5JlLk3gubz8A=;
	b=Xxvi13uMIuNd1i7qKKgkImlPAjK1xDFLxSCWyTWQlSWc0W0RYQ1MIbkdfqnYLZG9yu
	5JI71oibP9i2ddPwTU9YBExPCU3Dlsj9Hb5dtaQ5jQpFVrZe095cwJxIxT6yDBH5wF1p
	wCJApD147HK5V4ZzkFqufCd3njndvpO/gboYNoDeFKB07FcDW1Fik2Hzi8KFbGkqeU8B
	FnLAkMgm4iKJeXTHx5eicQowVzuFCmxijHVptaHIDUKgEIgd9VbBsMKuWbYIgOQnQmmN
	1oNq+b5+5oWwfawyEFBafayDt06Az4m3upS8lvLUrhifXOq6NRLkSxQqkth2e/4StwnK
	u5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=is8PyxvRhNytWxsxvai2fZ7Vunv6qUm5JlLk3gubz8A=;
	b=D5rfr/ThDhf9rSRdlnAO1x7HsGv9pY4GKYMt855g0bUl/ll+sTB9EyolzpTqB/KPiC
	De8e5w2vK9zEazvsdDC7oK0atwBI6kLSUoes8Lm42kxKEh6SimJN+F/M0OhwitUevLhH
	DjDbLE6NjEFK0gP4XF0w4qBuqWbdnFmErDRT6ddQo1wDGfU7Ev+gMGKOutn6bZKkcgKQ
	VpCoHFfWIsoE3/vcmOHGG6DwP4RMTqnWsaZOXDHWfEmdOKcQ2IMvAOvdEHSu2dxUKNTe
	4hY19oo3kqnpBCiPDVm5kvzFgGKI9Tn+JgIwOV88+1nFeM4PDlbXOQ5OLbUv2cf/JCdQ
	hTyA==
X-Gm-Message-State: APjAAAVLZa+8sJg+FUuQMRVCUCQTkR9jekONf+lyjPRUNwt/eCYGtTcy
	nIMg8VM8WCT/OhG6MgCpnfpfZQ==
X-Google-Smtp-Source: APXvYqzpRyNA15Vg4dJPptP9AquA0hd08+YvFQ9QkFLiFtu1omZ5ju/uevoFFYsI/1tqgZOzWDDXnw==
X-Received: by 2002:ac8:1a7d:: with SMTP id q58mr88042253qtk.310.1564668914103;
	Thu, 01 Aug 2019 07:15:14 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	e125sm29217763qkd.120.2019.08.01.07.15.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Aug 2019 07:15:13 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1htBrN-00082a-0Q; Thu, 01 Aug 2019 11:15:13 -0300
Date: Thu, 1 Aug 2019 11:15:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190801141512.GB23899@ziepe.ca>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMDE6MDI6MThQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzgvMSDkuIrljYgzOjMwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4g
PiBPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAwOToyODoyMFBNICswODAwLCBKYXNvbiBXYW5nIHdy
b3RlOgo+ID4gPiBPbiAyMDE5LzcvMzEg5LiL5Y2IODozOSwgSmFzb24gR3VudGhvcnBlIHdyb3Rl
Ogo+ID4gPiA+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDA0OjQ2OjUzQU0gLTA0MDAsIEphc29u
IFdhbmcgd3JvdGU6Cj4gPiA+ID4gPiBXZSB1c2VkIHRvIHVzZSBSQ1UgdG8gc3luY2hyb25pemUg
TU1VIG5vdGlmaWVyIHdpdGggd29ya2VyLiBUaGlzIGxlYWRzCj4gPiA+ID4gPiBjYWxsaW5nIHN5
bmNocm9uaXplX3JjdSgpIGluIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKS4gQnV0IG9uIGEgYnVz
eQo+ID4gPiA+ID4gc3lzdGVtLCB0aGVyZSB3b3VsZCBiZSBtYW55IGZhY3RvcnMgdGhhdCBtYXkg
c2xvdyBkb3duIHRoZQo+ID4gPiA+ID4gc3luY2hyb25pemVfcmN1KCkgd2hpY2ggbWFrZXMgaXQg
dW5zdWl0YWJsZSB0byBiZSBjYWxsZWQgaW4gTU1VCj4gPiA+ID4gPiBub3RpZmllci4KPiA+ID4g
PiA+IAo+ID4gPiA+ID4gQSBzb2x1dGlvbiBpcyBTUkNVIGJ1dCBpdHMgb3ZlcmhlYWQgaXMgb2J2
aW91cyB3aXRoIHRoZSBleHBlbnNpdmUgZnVsbAo+ID4gPiA+ID4gbWVtb3J5IGJhcnJpZXIuIEFu
b3RoZXIgY2hvaWNlIGlzIHRvIHVzZSBzZXFsb2NrLCBidXQgaXQgZG9lc24ndAo+ID4gPiA+ID4g
cHJvdmlkZSBhIHN5bmNocm9uaXphdGlvbiBtZXRob2QgYmV0d2VlbiByZWFkZXJzIGFuZCB3cml0
ZXJzLiBUaGUgbGFzdAo+ID4gPiA+ID4gY2hvaWNlIGlzIHRvIHVzZSB2cSBtdXRleCwgYnV0IGl0
IG5lZWQgdG8gZGVhbCB3aXRoIHRoZSB3b3JzdCBjYXNlCj4gPiA+ID4gPiB0aGF0IE1NVSBub3Rp
ZmllciBtdXN0IGJlIGJsb2NrZWQgYW5kIHdhaXQgZm9yIHRoZSBmaW5pc2ggb2Ygc3dhcCBpbi4K
PiA+ID4gPiA+IAo+ID4gPiA+ID4gU28gdGhpcyBwYXRjaCBzd2l0Y2hlcyB1c2UgYSBjb3VudGVy
IHRvIHRyYWNrIHdoZXRoZXIgb3Igbm90IHRoZSBtYXAKPiA+ID4gPiA+IHdhcyB1c2VkLiBUaGUg
Y291bnRlciB3YXMgaW5jcmVhc2VkIHdoZW4gdnEgdHJ5IHRvIHN0YXJ0IG9yIGZpbmlzaAo+ID4g
PiA+ID4gdXNlcyB0aGUgbWFwLiBUaGlzIG1lYW5zLCB3aGVuIGl0IHdhcyBldmVuLCB3ZSdyZSBz
dXJlIHRoZXJlJ3Mgbm8KPiA+ID4gPiA+IHJlYWRlcnMgYW5kIE1NVSBub3RpZmllciBpcyBzeW5j
aHJvbml6ZWQuIFdoZW4gaXQgd2FzIG9kZCwgaXQgbWVhbnMKPiA+ID4gPiA+IHRoZXJlJ3MgYSBy
ZWFkZXIgd2UgbmVlZCB0byB3YWl0IGl0IHRvIGJlIGV2ZW4gYWdhaW4gdGhlbiB3ZSBhcmUKPiA+
ID4gPiA+IHN5bmNocm9uaXplZC4KPiA+ID4gPiBZb3UganVzdCBkZXNjcmliZWQgYSBzZXFsb2Nr
Lgo+ID4gPiAKPiA+ID4gS2luZCBvZiwgc2VlIG15IGV4cGxhbmF0aW9uIGJlbG93Lgo+ID4gPiAK
PiA+ID4gCj4gPiA+ID4gV2UndmUgYmVlbiB0YWxraW5nIGFib3V0IHByb3ZpZGluZyB0aGlzIGFz
IHNvbWUgY29yZSBzZXJ2aWNlIGZyb20gbW11Cj4gPiA+ID4gbm90aWZpZXJzIGJlY2F1c2UgbmVh
cmx5IGV2ZXJ5IHVzZSBvZiB0aGlzIEFQSSBuZWVkcyBpdC4KPiA+ID4gCj4gPiA+IFRoYXQgd291
bGQgYmUgdmVyeSBoZWxwZnVsLgo+ID4gPiAKPiA+ID4gCj4gPiA+ID4gSU1ITyB0aGlzIGdldHMg
dGhlIHdob2xlIHRoaW5nIGJhY2t3YXJkcywgdGhlIGNvbW1vbiBwYXR0ZXJuIGlzIHRvCj4gPiA+
ID4gcHJvdGVjdCB0aGUgJ3NoYWRvdyBwdGUnIGRhdGEgd2l0aCBhIHNlcWxvY2sgKHVzdWFsbHkg
b3BlbiBjb2RlZCksCj4gPiA+ID4gc3VjaCB0aGF0IHRoZSBtbXUgbm90aWZpZmVyIHNpZGUgaGFz
IHRoZSB3cml0ZSBzaWRlIG9mIHRoYXQgbG9jayBhbmQKPiA+ID4gPiB0aGUgcmVhZCBzaWRlIGlz
IGNvbnN1bWVkIGJ5IHRoZSB0aHJlYWQgYWNjZXNzaW5nIG9yIHVwZGF0aW5nIHRoZSBTUFRFLgo+
ID4gPiAKPiA+ID4gWWVzLCBJJ3ZlIGNvbnNpZGVyZWQgc29tZXRoaW5nIGxpa2UgdGhhdC4gQnV0
IHRoZSBwcm9ibGVtIGlzLCBtbXUgbm90aWZpZXIKPiA+ID4gKHdyaXRlcikgbmVlZCB0byB3YWl0
IGZvciB0aGUgdmhvc3Qgd29ya2VyIHRvIGZpbmlzaCB0aGUgcmVhZCBiZWZvcmUgaXQgY2FuCj4g
PiA+IGRvIHRoaW5ncyBsaWtlIHNldHRpbmcgZGlydHkgcGFnZXMgYW5kIHVubWFwcGluZyBwYWdl
LsKgIEl0IGxvb2tzIHRvIG1lCj4gPiA+IHNlcWxvY2sgZG9lc24ndCBwcm92aWRlIHRoaW5ncyBs
aWtlIHRoaXMuCj4gPiBUaGUgc2VxbG9jayBpcyB1c3VhbGx5IHVzZWQgdG8gcHJldmVudCBhIDJu
ZCB0aHJlYWQgZnJvbSBhY2Nlc3NpbmcgdGhlCj4gPiBWQSB3aGlsZSBpdCBpcyBiZWluZyBjaGFu
Z2VkIGJ5IHRoZSBtbS4gaWUgeW91IHVzZSBzb21ldGhpbmcgc2VxbG9ja3kKPiA+IGluc3RlYWQg
b2YgdGhlIHVnbHkgbW11X25vdGlmaWVyX3VucmVnaXN0ZXIvcmVnaXN0ZXIgY3ljbGUuCj4gCj4g
Cj4gWWVzLCBzbyB3ZSBoYXZlIHR3byBtYXBwaW5nczoKPiAKPiBbMV0gdnJpbmcgYWRkcmVzcyB0
byBWQQo+IFsyXSBWQSB0byBQQQo+IAo+IEFuZCBoYXZlIHNldmVyYWwgcmVhZGVycyBhbmQgd3Jp
dGVycwo+IAo+IDEpIHNldF92cmluZ19udW1fYWRkcigpOiB3cml0ZXIgb2YgYm90aCBbMV0gYW5k
IFsyXQo+IDIpIE1NVSBub3RpZmllcjogcmVhZGVyIG9mIFsxXSB3cml0ZXIgb2YgWzJdCj4gMykg
R1VQOiByZWFkZXIgb2YgWzFdIHdyaXRlciBvZiBbMl0KPiA0KSBtZW1vcnkgYWNjZXNzb3JzOiBy
ZWFkZXIgb2YgWzFdIGFuZCBbMl0KPiAKPiBGb3J0dW5hdGVseSwgMSkgMykgYW5kIDQpIGhhdmUg
YWxyZWFkeSBzeW5jaHJvbml6ZWQgdGhyb3VnaCB2cS0+bXV0ZXguIFdlCj4gb25seSBuZWVkIHRv
IGRlYWwgd2l0aCBzeW5jaHJvbml6YXRpb24gYmV0d2VlbiAyKSBhbmQgZWFjaCBvZiB0aGUgcmVz
ZXQ6Cj4gU3luYyBiZXR3ZWVuIDEpIGFuZCAyKTogRm9yIG1hcHBpbmcgWzFdLCBJIGRvCj4gbW11
X25vdGlmaWVyX3VucmVnaXN0ZXIvcmVnaXN0ZXIuIFRoaXMgaGVscCB0byBhdm9pZCBob2xkaW5n
IGFueSBsb2NrIHRvIGRvCj4gb3ZlcmxhcCBjaGVjay4KCkkgc3VzcGVjdCB5b3UgY291bGQgaGF2
ZSBkb25lIHRoaXMgd2l0aCBhIFJDVSB0ZWNobmlxdWUgaW5zdGVhZCBvZgpyZWdpc3Rlci91bnJl
Z2lzdGVyLgoKPiBTeW5jIGJldHdlZW4gMikgYW5kIDQpOiBGb3IgbWFwcGluZyBbMV0sIGJvdGgg
YXJlIHJlYWRlcnMsIG5vIG5lZWQgYW55Cj4gc3luY2hyb25pemF0aW9uLiBGb3IgbWFwcGluZyBb
Ml0sIHN5bmNocm9uaXplIHRocm91Z2ggUkNVIChvciBzb21ldGhpbmcKPiBzaW1saWFyIHRvIHNl
cWxvY2spLgoKWW91IGNhbid0IHJlYWxseSB1c2UgYSBzZXFsb2NrLCBzZXFsb2NrcyBhcmUgY29s
bGlzaW9uLXJldHJ5IGxvY2tzLAphbmQgdGhlIHNlbWFudGljIGhlcmUgaXMgdGhhdCBpbnZhbGlk
YXRlX3JhbmdlX3N0YXJ0ICpNVVNUKiBub3QKY29udGludWUgdW50aWwgdGhyZWFkIGRvaW5nICM0
IGFib3ZlIGlzIGd1YXJlbnRlZWQgbm8gbG9uZ2VyIHRvdWNoaW5nCnRoZSBtZW1vcnkuCgpUaGlz
IG11c3QgYmUgYSBwcm9wZXIgYmFycmllciwgbGlrZSBhIHNwaW5sb2NrLCBtdXRleCwgb3IKc3lu
Y2hyb25pemVfcmN1LgoKQW5kLCBhZ2FpbiwgeW91IGNhbid0IHJlLWludmVudCBhIHNwaW5sb2Nr
IHdpdGggb3BlbiBjb2RpbmcgYW5kIGdldApzb21ldGhpbmcgYmV0dGVyLgoKSmFzb24KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
