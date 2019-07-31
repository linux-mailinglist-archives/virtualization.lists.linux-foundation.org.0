Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 286787CD0B
	for <lists.virtualization@lfdr.de>; Wed, 31 Jul 2019 21:43:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1315E4166;
	Wed, 31 Jul 2019 19:43:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 97ACC4164
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 19:31:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EEE3C6CE
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 19:30:59 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id o2so27450021uae.10
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 12:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=V4Wcp011k9h7N5iAJkWpP1Nbu9oN4M2GGvG06LvdU2U=;
	b=fUaCEUhNC4Tuu1n1nF8asI51cgg70GaR9H/nMdDM2BZwKIGwYESyC+ANrzEzNbyCCK
	Oo9kAgTUGUCRJpgDkeKVwv2v7LNE0yerjxD0FFu+TlVm1wemvoI2V5qJum7RZWCsIsFu
	caZSoA1qPEKO3nEIy2wlsOXadZQb5TaaAqtNv95x4AfEvUSG01PbXA2WgagTZHsb7aMz
	DXvwhLJ2m6xnSVDL9BTKqy7XAh7eilMxSkpBweTk3v2EiycxvGfTJMtMv1lYRBGBE0MV
	Tk6sq+Q07tuHcFgS507UyAJFXfBxy4xzy4NGxxbF1CNkFe49Cf8Iq4yLVLNYGHjD92T2
	DCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=V4Wcp011k9h7N5iAJkWpP1Nbu9oN4M2GGvG06LvdU2U=;
	b=LD2g1H5EYu3emcVpaHNovIIRpcEG4JYxYm+B2nQEk9wE3DIl6v6a+02l7c+0f/CmDD
	/VTF0GRUj0ESew4dpiI6KMEDXOTp0HyxpLugeQIEA0VwldfHgRGcuHgwFAON9ZB/G5RB
	WJQfkI6BgSSWPdXu+WojTQclWOeLElrgJGwicaaI9HsZYVIpMKrIrzuhp2yLrWYrj3qi
	iLEB5CDl4VAC6tbPpKx2PHuIZpP8KMa98D0izyqHdS0LQV+tayRmFet73bcOMPax0B2G
	EdF32Vnlqz+VXrTQSJgK96KeRAaD7YeHalJNzDqwGT/mFcQJ8RgX+FB9SQ+hW/biPEnP
	gGiQ==
X-Gm-Message-State: APjAAAVjWpIhYTFxFofW7hlS/x0OiPhyvXVkY91GPq8K2g7b1GtWxoRi
	YNMj1ta1OkFbdt0PBstrEob8sw==
X-Google-Smtp-Source: APXvYqzup5DZ6q8bxH1OXHSeDiBtafoJQmznWiwBSNHtM04i2y2ha7deX2jX6U9UfYm6veI89m6bZw==
X-Received: by 2002:ab0:49b0:: with SMTP id e45mr17499877uad.120.1564601458846;
	Wed, 31 Jul 2019 12:30:58 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	10sm28842460vkl.33.2019.07.31.12.30.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Jul 2019 12:30:58 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1hsuJN-0007XW-Lr; Wed, 31 Jul 2019 16:30:57 -0300
Date: Wed, 31 Jul 2019 16:30:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190731193057.GG3946@ziepe.ca>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
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

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDk6Mjg6MjBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzcvMzEg5LiL5Y2IODozOSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDQ6NDY6NTNBTSAtMDQwMCwgSmFzb24gV2FuZyB3
cm90ZToKPiA+ID4gV2UgdXNlZCB0byB1c2UgUkNVIHRvIHN5bmNocm9uaXplIE1NVSBub3RpZmll
ciB3aXRoIHdvcmtlci4gVGhpcyBsZWFkcwo+ID4gPiBjYWxsaW5nIHN5bmNocm9uaXplX3JjdSgp
IGluIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKS4gQnV0IG9uIGEgYnVzeQo+ID4gPiBzeXN0ZW0s
IHRoZXJlIHdvdWxkIGJlIG1hbnkgZmFjdG9ycyB0aGF0IG1heSBzbG93IGRvd24gdGhlCj4gPiA+
IHN5bmNocm9uaXplX3JjdSgpIHdoaWNoIG1ha2VzIGl0IHVuc3VpdGFibGUgdG8gYmUgY2FsbGVk
IGluIE1NVQo+ID4gPiBub3RpZmllci4KPiA+ID4gCj4gPiA+IEEgc29sdXRpb24gaXMgU1JDVSBi
dXQgaXRzIG92ZXJoZWFkIGlzIG9idmlvdXMgd2l0aCB0aGUgZXhwZW5zaXZlIGZ1bGwKPiA+ID4g
bWVtb3J5IGJhcnJpZXIuIEFub3RoZXIgY2hvaWNlIGlzIHRvIHVzZSBzZXFsb2NrLCBidXQgaXQg
ZG9lc24ndAo+ID4gPiBwcm92aWRlIGEgc3luY2hyb25pemF0aW9uIG1ldGhvZCBiZXR3ZWVuIHJl
YWRlcnMgYW5kIHdyaXRlcnMuIFRoZSBsYXN0Cj4gPiA+IGNob2ljZSBpcyB0byB1c2UgdnEgbXV0
ZXgsIGJ1dCBpdCBuZWVkIHRvIGRlYWwgd2l0aCB0aGUgd29yc3QgY2FzZQo+ID4gPiB0aGF0IE1N
VSBub3RpZmllciBtdXN0IGJlIGJsb2NrZWQgYW5kIHdhaXQgZm9yIHRoZSBmaW5pc2ggb2Ygc3dh
cCBpbi4KPiA+ID4gCj4gPiA+IFNvIHRoaXMgcGF0Y2ggc3dpdGNoZXMgdXNlIGEgY291bnRlciB0
byB0cmFjayB3aGV0aGVyIG9yIG5vdCB0aGUgbWFwCj4gPiA+IHdhcyB1c2VkLiBUaGUgY291bnRl
ciB3YXMgaW5jcmVhc2VkIHdoZW4gdnEgdHJ5IHRvIHN0YXJ0IG9yIGZpbmlzaAo+ID4gPiB1c2Vz
IHRoZSBtYXAuIFRoaXMgbWVhbnMsIHdoZW4gaXQgd2FzIGV2ZW4sIHdlJ3JlIHN1cmUgdGhlcmUn
cyBubwo+ID4gPiByZWFkZXJzIGFuZCBNTVUgbm90aWZpZXIgaXMgc3luY2hyb25pemVkLiBXaGVu
IGl0IHdhcyBvZGQsIGl0IG1lYW5zCj4gPiA+IHRoZXJlJ3MgYSByZWFkZXIgd2UgbmVlZCB0byB3
YWl0IGl0IHRvIGJlIGV2ZW4gYWdhaW4gdGhlbiB3ZSBhcmUKPiA+ID4gc3luY2hyb25pemVkLgo+
ID4gWW91IGp1c3QgZGVzY3JpYmVkIGEgc2VxbG9jay4KPiAKPiAKPiBLaW5kIG9mLCBzZWUgbXkg
ZXhwbGFuYXRpb24gYmVsb3cuCj4gCj4gCj4gPiAKPiA+IFdlJ3ZlIGJlZW4gdGFsa2luZyBhYm91
dCBwcm92aWRpbmcgdGhpcyBhcyBzb21lIGNvcmUgc2VydmljZSBmcm9tIG1tdQo+ID4gbm90aWZp
ZXJzIGJlY2F1c2UgbmVhcmx5IGV2ZXJ5IHVzZSBvZiB0aGlzIEFQSSBuZWVkcyBpdC4KPiAKPiAK
PiBUaGF0IHdvdWxkIGJlIHZlcnkgaGVscGZ1bC4KPiAKPiAKPiA+IAo+ID4gSU1ITyB0aGlzIGdl
dHMgdGhlIHdob2xlIHRoaW5nIGJhY2t3YXJkcywgdGhlIGNvbW1vbiBwYXR0ZXJuIGlzIHRvCj4g
PiBwcm90ZWN0IHRoZSAnc2hhZG93IHB0ZScgZGF0YSB3aXRoIGEgc2VxbG9jayAodXN1YWxseSBv
cGVuIGNvZGVkKSwKPiA+IHN1Y2ggdGhhdCB0aGUgbW11IG5vdGlmaWZlciBzaWRlIGhhcyB0aGUg
d3JpdGUgc2lkZSBvZiB0aGF0IGxvY2sgYW5kCj4gPiB0aGUgcmVhZCBzaWRlIGlzIGNvbnN1bWVk
IGJ5IHRoZSB0aHJlYWQgYWNjZXNzaW5nIG9yIHVwZGF0aW5nIHRoZSBTUFRFLgo+IAo+IAo+IFll
cywgSSd2ZSBjb25zaWRlcmVkIHNvbWV0aGluZyBsaWtlIHRoYXQuIEJ1dCB0aGUgcHJvYmxlbSBp
cywgbW11IG5vdGlmaWVyCj4gKHdyaXRlcikgbmVlZCB0byB3YWl0IGZvciB0aGUgdmhvc3Qgd29y
a2VyIHRvIGZpbmlzaCB0aGUgcmVhZCBiZWZvcmUgaXQgY2FuCj4gZG8gdGhpbmdzIGxpa2Ugc2V0
dGluZyBkaXJ0eSBwYWdlcyBhbmQgdW5tYXBwaW5nIHBhZ2UuwqAgSXQgbG9va3MgdG8gbWUKPiBz
ZXFsb2NrIGRvZXNuJ3QgcHJvdmlkZSB0aGluZ3MgbGlrZSB0aGlzLsKgIAoKVGhlIHNlcWxvY2sg
aXMgdXN1YWxseSB1c2VkIHRvIHByZXZlbnQgYSAybmQgdGhyZWFkIGZyb20gYWNjZXNzaW5nIHRo
ZQpWQSB3aGlsZSBpdCBpcyBiZWluZyBjaGFuZ2VkIGJ5IHRoZSBtbS4gaWUgeW91IHVzZSBzb21l
dGhpbmcgc2VxbG9ja3kKaW5zdGVhZCBvZiB0aGUgdWdseSBtbXVfbm90aWZpZXJfdW5yZWdpc3Rl
ci9yZWdpc3RlciBjeWNsZS4KCllvdSBhcmUgc3VwcG9zZWQgdG8gdXNlIHNvbWV0aGluZyBzaW1w
bGUgbGlrZSBhIHNwaW5sb2NrIG9yIG11dGV4Cmluc2lkZSB0aGUgaW52YWxpZGF0ZV9yYW5nZV9z
dGFydCB0byBzZXJpYWxpemVkIHRlYXIgZG93biBvZiB0aGUgU1BURXMKd2l0aCB0aGVpciBhY2Nl
c3NvcnMuCgo+IHdyaXRlX3NlcWNvdW50X2JlZ2luKCkKPiAKPiBtYXAgPSB2cS0+bWFwW1hdCj4g
Cj4gd3JpdGUgb3IgcmVhZCB0aHJvdWdoIG1hcC0+YWRkciBkaXJlY3RseQo+IAo+IHdyaXRlX3Nl
cWNvdW50X2VuZCgpCj4gCj4gCj4gVGhlcmUncyBubyBybWIoKSBpbiB3cml0ZV9zZXFjb3VudF9i
ZWdpbigpLCBzbyBtYXAgY291bGQgYmUgcmVhZCBiZWZvcmUKPiB3cml0ZV9zZXFjb3VudF9iZWdp
bigpLCBidXQgaXQgbG9va3MgdG8gbWUgbm93IHRoYXQgdGhpcyBkb2Vzbid0IGhhcm0gYXQKPiBh
bGwsIG1heWJlIHdlIGNhbiB0cnkgdGhpcyB3YXkuCgpUaGF0IGlzIGJlY2F1c2UgaXQgaXMgYSB3
cml0ZSBzaWRlIGxvY2ssIG5vdCBhIHJlYWQgbG9jay4gSUlSQwpzZXFsb2NrcyBoYXZlIHdlYWtl
ciBiYXJyaWVycyBiZWNhdXNlIHRoZSB3cml0ZSBzaWRlIG5lZWRzIHRvIGJlCnNlcmlhbGl6ZWQg
aW4gc29tZSBvdGhlciB3YXkuCgpUaGUgcmVxdWlyZW1lbnQgSSBzZWUgaXMgeW91IG5lZWQgaW52
YWxpZGF0ZV9yYW5nZV9zdGFydCB0byBibG9jawp1bnRpbCBhbm90aGVyIHRocmVhZCBleGl0cyBp
dHMgY3JpdGljYWwgc2VjdGlvbiAoaWUgc3RvcHMgYWNjZXNzaW5nCnRoZSBTUFRFcykuIAoKVGhh
dCBpcyBhIHNwaW5sb2NrL211dGV4LgoKWW91IGp1c3QgY2FuJ3QgaW52ZW50IGEgZmFzdGVyIHNw
aW5sb2NrIGJ5IG9wZW4gY29kaW5nIHNvbWV0aGluZyB3aXRoCmJhcnJpZXJzLCBpdCBkb2Vzbid0
IHdvcmsuCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
