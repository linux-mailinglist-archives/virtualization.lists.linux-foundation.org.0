Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 736FA89F16
	for <lists.virtualization@lfdr.de>; Mon, 12 Aug 2019 15:03:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6D41BCDF;
	Mon, 12 Aug 2019 13:02:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B34C0CC6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 13:02:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2ED988A0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 13:02:54 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id k13so5367074qtm.12
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 06:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=I794i5k43EsX/FqVLogBrtzHtLMobYzeCJsdWXiK9Gc=;
	b=VMgdsQq00foWkXG/3nO+dBstUoK1bGkCBdbj9tS6O2XJlAF+Gd74zMHMUkA+Njtq4M
	1/R9J5gzrQ28tiWtpEqv2TjemV4M0eUiyIrSXf3PQ8hy0bwMcgJk12CEU13SqDS3og6j
	JNN5DHxPwGYfzdPhRKhbUFwfch3e+YN+7HQiep9xP8CG++3zdsw5PnkTxkB2wXiq4SvK
	Jc/cZ3HS14Cb68kj4QXOugj+o8lOW80EABX+K7Y83ls68HVVwPHmyEC64WGA0jWTztDl
	Bgnp7cqMgeUbOoIkbiXSIXIHXYfgIR+WzAN3wNxJXn3/4k/pz1vaR9bWK24wuzC3Bdl/
	+Scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=I794i5k43EsX/FqVLogBrtzHtLMobYzeCJsdWXiK9Gc=;
	b=FczINFo9zkGqH7cmfyzPLDPCTUrcZhGjiHIo3qkxf/j+M2e6Ee7D1GJn89FyqJ8++R
	e2Mm1OUvcIy64c79FbAWwsNOMCq+6Mzo3J1ywXeej3EQZHrwzfi6a2uQ3+o8r1D8j7Lz
	yaxxvrCmCvUNP248cnEb4zU95d+ufQkeHI6nkt6XuM16YKdcB78jtqIdUb9OJAAzwOH7
	uSLPecqLsT+v7Dlu+y8dXSiztI/rOSSM69lSbRSzXW9XF9pxo506cSDFxyywkB4n4Juu
	F6Och6CM8RS+4w65xE/es4Yhfk0lZkXl73rDU77R1w55fikXQIY/7pHcPh3CoFqqzVtS
	jj8g==
X-Gm-Message-State: APjAAAVdfUlOkssiu4Zm3NxqBXHkiHcN6WyEWwX3Xs+A1gMhystoaP+u
	MNbZHIxpJDH/kIHjuWUmcA3n9Q==
X-Google-Smtp-Source: APXvYqxZv3qaTOwcS5IthcJTSrZw2AL6CRuxLGSASG1s5/gI7k9gv8676nfdtEsaySWFu9y0gecVIg==
X-Received: by 2002:a0c:f687:: with SMTP id p7mr8778029qvn.160.1565614973155; 
	Mon, 12 Aug 2019 06:02:53 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	f22sm42714130qkk.45.2019.08.12.06.02.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Aug 2019 06:02:52 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1hx9yO-0007Sg-5c; Mon, 12 Aug 2019 10:02:52 -0300
Date: Mon, 12 Aug 2019 10:02:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V5 0/9] Fixes for vhost metadata acceleration
Message-ID: <20190812130252.GE24457@ziepe.ca>
References: <20190809054851.20118-1-jasowang@redhat.com>
	<20190810134948-mutt-send-email-mst@kernel.org>
	<360a3b91-1ac5-84c0-d34b-a4243fa748c4@redhat.com>
	<20190812054429-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812054429-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMDU6NDk6MDhBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+IE9uIE1vbiwgQXVnIDEyLCAyMDE5IGF0IDEwOjQ0OjUxQU0gKzA4MDAsIEph
c29uIFdhbmcgd3JvdGU6Cj4gPiAKPiA+IE9uIDIwMTkvOC8xMSDkuIrljYgxOjUyLCBNaWNoYWVs
IFMuIFRzaXJraW4gd3JvdGU6Cj4gPiA+IE9uIEZyaSwgQXVnIDA5LCAyMDE5IGF0IDAxOjQ4OjQy
QU0gLTA0MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiA+ID4gSGkgYWxsOgo+ID4gPiA+IAo+ID4g
PiA+IFRoaXMgc2VyaWVzIHRyeSB0byBmaXggc2V2ZXJhbCBpc3N1ZXMgaW50cm9kdWNlZCBieSBt
ZXRhIGRhdGEKPiA+ID4gPiBhY2NlbHJlYXRpb24gc2VyaWVzLiBQbGVhc2UgcmV2aWV3Lgo+ID4g
PiA+IAo+ID4gPiA+IENoYW5nZXMgZnJvbSBWNDoKPiA+ID4gPiAtIHN3aXRjaCB0byB1c2Ugc3Bp
bmxvY2sgc3luY2hyb25pemUgTU1VIG5vdGlmaWVyIHdpdGggYWNjZXNzb3JzCj4gPiA+ID4gCj4g
PiA+ID4gQ2hhbmdlcyBmcm9tIFYzOgo+ID4gPiA+IC0gcmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBw
YXRjaAo+ID4gPiA+IAo+ID4gPiA+IENoYW5nZXMgZnJvbSBWMjoKPiA+ID4gPiAtIHVzZSBzZXFs
Y2sgaGVscGVyIHRvIHN5bmNocm9uaXplIE1NVSBub3RpZmllciB3aXRoIHZob3N0IHdvcmtlcgo+
ID4gPiA+IAo+ID4gPiA+IENoYW5nZXMgZnJvbSBWMToKPiA+ID4gPiAtIHRyeSBub3QgdXNlIFJD
VSB0byBzeW5jcmhvbml6ZSBNTVUgbm90aWZpZXIgd2l0aCB2aG9zdCB3b3JrZXIKPiA+ID4gPiAt
IHNldCBkaXJ0eSBwYWdlcyBhZnRlciBubyByZWFkZXJzCj4gPiA+ID4gLSByZXR1cm4gLUVBR0FJ
TiBvbmx5IHdoZW4gd2UgZmluZCB0aGUgcmFuZ2UgaXMgb3ZlcmxhcHBlZCB3aXRoCj4gPiA+ID4g
ICAgbWV0YWRhdGEKPiA+ID4gPiAKPiA+ID4gPiBKYXNvbiBXYW5nICg5KToKPiA+ID4gPiAgICB2
aG9zdDogZG9uJ3Qgc2V0IHVhZGRyIGZvciBpbnZhbGlkIGFkZHJlc3MKPiA+ID4gPiAgICB2aG9z
dDogdmFsaWRhdGUgTU1VIG5vdGlmaWVyIHJlZ2lzdHJhdGlvbgo+ID4gPiA+ICAgIHZob3N0OiBm
aXggdmhvc3QgbWFwIGxlYWsKPiA+ID4gPiAgICB2aG9zdDogcmVzZXQgaW52YWxpZGF0ZV9jb3Vu
dCBpbiB2aG9zdF9zZXRfdnJpbmdfbnVtX2FkZHIoKQo+ID4gPiA+ICAgIHZob3N0OiBtYXJrIGRp
cnR5IHBhZ2VzIGR1cmluZyBtYXAgdW5pbml0Cj4gPiA+ID4gICAgdmhvc3Q6IGRvbid0IGRvIHN5
bmNocm9uaXplX3JjdSgpIGluIHZob3N0X3VuaW5pdF92cV9tYXBzKCkKPiA+ID4gPiAgICB2aG9z
dDogZG8gbm90IHVzZSBSQ1UgdG8gc3luY2hyb25pemUgTU1VIG5vdGlmaWVyIHdpdGggd29ya2Vy
Cj4gPiA+ID4gICAgdmhvc3Q6IGNvcnJlY3RseSBzZXQgZGlydHkgcGFnZXMgaW4gTU1VIG5vdGlm
aWVycyBjYWxsYmFjawo+ID4gPiA+ICAgIHZob3N0OiBkbyBub3QgcmV0dXJuIC1FQUdBSU4gZm9y
IG5vbiBibG9ja2luZyBpbnZhbGlkYXRpb24gdG9vIGVhcmx5Cj4gPiA+ID4gCj4gPiA+ID4gICBk
cml2ZXJzL3Zob3N0L3Zob3N0LmMgfCAyMDIgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tCj4gPiA+ID4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmggfCAgIDYgKy0KPiA+
ID4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTIyIGluc2VydGlvbnMoKyksIDg2IGRlbGV0aW9ucygt
KQo+ID4gPiBUaGlzIGdlbmVyYWxseSBsb29rcyBtb3JlIHNvbGlkLgo+ID4gPiAKPiA+ID4gQnV0
IHRoaXMgYW1vdW50cyB0byBhIHNpZ25pZmljYW50IG92ZXJoYXVsIG9mIHRoZSBjb2RlLgo+ID4g
PiAKPiA+ID4gQXQgdGhpcyBwb2ludCBob3cgYWJvdXQgd2UgcmV2ZXJ0IDdmNDY2MDMyZGM5ZTVh
NjEyMTdmMjJlYTM0YjJkZjkzMjc4NmJiZmMKPiA+ID4gZm9yIHRoaXMgcmVsZWFzZSwgYW5kIHRo
ZW4gcmUtYXBwbHkgYSBjb3JyZWN0ZWQgdmVyc2lvbgo+ID4gPiBmb3IgdGhlIG5leHQgb25lPwo+
ID4gCj4gPiAKPiA+IElmIHBvc3NpYmxlLCBjb25zaWRlciB3ZSd2ZSBhY3R1YWxseSBkaXNhYmxl
ZCB0aGUgZmVhdHVyZS4gSG93IGFib3V0IGp1c3QKPiA+IHF1ZXVlZCB0aG9zZSBwYXRjaGVzIGZv
ciBuZXh0IHJlbGVhc2U/Cj4gPiAKPiA+IFRoYW5rcwo+IAo+IFNvcnJ5IGlmIEkgd2FzIHVuY2xl
YXIuIE15IGlkZWEgaXMgdGhhdAo+IDEuIEkgcmV2ZXJ0IHRoZSBkaXNhYmxlZCBjb2RlCj4gMi4g
WW91IHNlbmQgYSBwYXRjaCByZWFkZGluZyBpdCB3aXRoIGFsbCB0aGUgZml4ZXMgc3F1YXNoZWQK
PiAzLiBNYXliZSBvcHRpbWl6YXRpb25zIG9uIHRvcCByaWdodCBhd2F5Pwo+IDQuIFdlIHF1ZXVl
ICp0aGF0KiBmb3IgbmV4dCBhbmQgc2VlIHdoYXQgaGFwcGVucy4KPiAKPiBBbmQgdGhlIGFkdmFu
dGFnZSBvdmVyIHRoZSBwYXRjaHkgYXBwcm9hY2ggaXMgdGhhdCB0aGUgY3VycmVudCBwYXRjaGVz
Cj4gYXJlIGhhcmQgdG8gcmV2aWV3LiBFLmcuICBpdCdzIG5vdCByZWFzb25hYmxlIHRvIGFzayBS
Q1UgZ3V5cyB0byByZXZpZXcKPiB0aGUgd2hvbGUgb2Ygdmhvc3QgZm9yIFJDVSB1c2FnZSBidXQg
aXQncyBtdWNoIG1vcmUgcmVhc29uYWJsZSB0byBhc2sKPiBhYm91dCBhIHNwZWNpZmljIHBhdGNo
LgoKSSB0aGluayB0aGVyZSBhcmUgb3RoZXIgcHJvYmxlbXMgaGVyZSB0b28sIEkgZG9uJ3QgbGlr
ZSB0aGF0IHRoZSB1c2UKb2YgbW11IG5vdGlmaWVycyBpcyBzbyBkaWZmZXJlbnQgZnJvbSBldmVy
eSBvdGhlciBkcml2ZXIsIG9yIHRoYXQgR1VQCmlzIGNhbGxlZCB1bmRlciBzcGlubG9jay4KClNv
IEkgZmF2b3IgdGhlIHJldmVydCBhbmQgdHJ5IGFnYWluIGFwcHJvYWNoIGFzIHdlbGwuIEl0IGlz
IGhhcmQgdG8KZ2V0IGEgY2xlYXIgcGljdHVyZSB3aXRoIHRoZXNlIGVuZGxlc3MgYnVnIGZpeCBw
YXRjaGVzCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
