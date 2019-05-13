Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6891BC3F
	for <lists.virtualization@lfdr.de>; Mon, 13 May 2019 19:51:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5A6F5F2C;
	Mon, 13 May 2019 17:51:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1353EE7F
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 17:51:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 797A342D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 17:51:43 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c66so512366wme.0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 10:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=YywBhd718B/DKtpyrTe7ekQZi7NNkVMxHXFs5r/UkzU=;
	b=hUw5RrV+cbFAe1/JJqxxtBW+4GNhX0R5t/NaswyHXV3W3gct+4OJqicJvAXLZmVIeV
	KduS13Y9rmjjv6MUj2/vdcF2jDhOAkN9Dqv4yQ5SVaoIBeTx5p4keokNQqMMhfPQYsQg
	iOHVSiAPrfG13QM6QFfQqWwv/70E0NW9vB3s9JPj+69PU8r+32nxmg2hW0MHhzztG5Ri
	WTsLv2oLZPsgtUlLFv/LTzpt2ef55WXSTbnKjiFs7fUKURSFK5833IRFdU8OUzSKyMJ5
	1VSr/nTV1N42TUzVScecn7kPd3AYweMY05JJPfTPgdnLtpLSDA5DA6dreyGbpb32R7Yk
	fcng==
X-Gm-Message-State: APjAAAWlNNm9jIa2PUSJ9LpRFcPdB1X18tEXqLDpnQMaU5GdlZqEN9pm
	en4+cvbsGDVQFdiDioPyyECm9g==
X-Google-Smtp-Source: APXvYqwIUwuqMl8h+g4rfizOwGvKS5bfbCa0CnOcHXmQACgAyWBKmcpVwSB4wHSIlaL+ZzJ2dbSatQ==
X-Received: by 2002:a1c:f910:: with SMTP id x16mr16414740wmh.114.1557769902025;
	Mon, 13 May 2019 10:51:42 -0700 (PDT)
Received: from steredhat (host151-251-static.12-87-b.business.telecomitalia.it.
	[87.12.251.151]) by smtp.gmail.com with ESMTPSA id
	y40sm14326745wrd.96.2019.05.13.10.51.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 May 2019 10:51:41 -0700 (PDT)
Date: Mon, 13 May 2019 19:51:38 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2 7/8] vsock/virtio: increase RX buffer size to 64 KiB
Message-ID: <20190513175138.4yycad2xi65komw6@steredhat>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-8-sgarzare@redhat.com>
	<bf0416f1-0e69-722d-75ce-3d101e6d7d71@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf0416f1-0e69-722d-75ce-3d101e6d7d71@redhat.com>
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

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDY6MDE6NTJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzUvMTAg5LiL5Y2IODo1OCwgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3Rl
Ogo+ID4gSW4gb3JkZXIgdG8gaW5jcmVhc2UgaG9zdCAtPiBndWVzdCB0aHJvdWdocHV0IHdpdGgg
bGFyZ2UgcGFja2V0cywKPiA+IHdlIGNhbiB1c2UgNjQgS2lCIFJYIGJ1ZmZlcnMuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gR2FyemFyZWxsYSA8c2dhcnphcmVAcmVkaGF0LmNvbT4K
PiA+IC0tLQo+ID4gICBpbmNsdWRlL2xpbnV4L3ZpcnRpb192c29jay5oIHwgMiArLQo+ID4gICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvdmlydGlvX3Zzb2NrLmggYi9pbmNsdWRlL2xpbnV4L3Zp
cnRpb192c29jay5oCj4gPiBpbmRleCA4NGI3MjAyNmQzMjcuLjVhOWQyNWJlNzJkZiAxMDA2NDQK
PiA+IC0tLSBhL2luY2x1ZGUvbGludXgvdmlydGlvX3Zzb2NrLmgKPiA+ICsrKyBiL2luY2x1ZGUv
bGludXgvdmlydGlvX3Zzb2NrLmgKPiA+IEBAIC0xMCw3ICsxMCw3IEBACj4gPiAgICNkZWZpbmUg
VklSVElPX1ZTT0NLX0RFRkFVTFRfTUlOX0JVRl9TSVpFCTEyOAo+ID4gICAjZGVmaW5lIFZJUlRJ
T19WU09DS19ERUZBVUxUX0JVRl9TSVpFCQkoMTAyNCAqIDI1NikKPiA+ICAgI2RlZmluZSBWSVJU
SU9fVlNPQ0tfREVGQVVMVF9NQVhfQlVGX1NJWkUJKDEwMjQgKiAyNTYpCj4gPiAtI2RlZmluZSBW
SVJUSU9fVlNPQ0tfREVGQVVMVF9SWF9CVUZfU0laRQkoMTAyNCAqIDQpCj4gPiArI2RlZmluZSBW
SVJUSU9fVlNPQ0tfREVGQVVMVF9SWF9CVUZfU0laRQkoMTAyNCAqIDY0KQo+ID4gICAjZGVmaW5l
IFZJUlRJT19WU09DS19NQVhfQlVGX1NJWkUJCTB4RkZGRkZGRkZVTAo+ID4gICAjZGVmaW5lIFZJ
UlRJT19WU09DS19NQVhfUEtUX0JVRl9TSVpFCQkoMTAyNCAqIDY0KQo+IAo+IAo+IFdlIHByb2Jh
Ymx5IGRvbid0IHdhbnQgc3VjaCBoaWdoIG9yZGVyIGFsbG9jYXRpb24uIEl0J3MgYmV0dGVyIHRv
IHN3aXRjaCB0bwo+IHVzZSBvcmRlciAwIHBhZ2VzIGluIHRoaXMgY2FzZS4gU2VlIGFkZF9yZWN2
YnVmX2JpZygpIGZvciB2aXJ0aW8tbmV0LiBJZiB3ZQo+IGdldCBkYXRhcGF0aCB1bmlmaWVkLCB3
ZSB3aWxsIGdldCBtb3JlIHN0dWZmcyBzZXQuCgpJSVVDLCB5b3UgYXJlIHN1Z2dlc3RpbmcgdG8g
YWxsb2NhdGUgb25seSBwYWdlcyBhbmQgcHV0IHRoZW0gaW4gYQpzY2F0dGVybGlzdCwgdGhlbiBh
ZGQgdGhlbSB0byB0aGUgdmlydHF1ZXVlLgoKSXMgaXQgY29ycmVjdD8KClRoZSBpc3N1ZSB0aGF0
IEkgaGF2ZSBoZXJlLCBpcyB0aGF0IHRoZSB2aXJ0aW8tdnNvY2sgZ3Vlc3QgZHJpdmVyLCBzZWUK
dmlydGlvX3Zzb2NrX3J4X2ZpbGwoKSwgYWxsb2NhdGVzIGEgc3RydWN0IHZpcnRpb192c29ja19w
a3QgdGhhdApjb250YWlucyB0aGUgcm9vbSBmb3IgdGhlIGhlYWRlciwgdGhlbiBhbGxvY2F0ZXMg
dGhlIGJ1ZmZlciBmb3IgdGhlIHBheWxvYWQuCkF0IHRoaXMgcG9pbnQgaXQgZmlsbHMgdGhlIHNj
YXR0ZXJsaXN0IHdpdGggdGhlICZ2aXJ0aW9fdnNvY2tfcGt0LmhkciBhbmQgdGhlCmJ1ZmZlciBm
b3IgdGhlIHBheWxvYWQuCgpDaGFuZ2luZyB0aGlzIHdpbGwgcmVxdWlyZSBzZXZlcmFsIG1vZGlm
aWNhdGlvbnMsIGFuZCBpZiB3ZSBnZXQgZGF0YXBhdGgKdW5pZmllZCwgSSdtIG5vdCBzdXJlIGl0
J3Mgd29ydGggaXQuCk9mIGNvdXJzZSwgaWYgd2UgbGVhdmUgdGhlIGRhdGFwYXRocyBzZXBhcmF0
ZWQsIEknZCBsaWtlIHRvIGRvIHRoYXQgbGF0ZXIuCgpXaGF0IGRvIHlvdSB0aGluaz8KClRoYW5r
cywKU3RlZmFubwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=
