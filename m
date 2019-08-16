Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1184C90729
	for <lists.virtualization@lfdr.de>; Fri, 16 Aug 2019 19:45:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0EB4CCB6;
	Fri, 16 Aug 2019 17:45:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 27661CA6
	for <virtualization@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 17:45:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 72FDF786
	for <virtualization@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 17:45:05 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id 44so6926100qtg.11
	for <virtualization@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 10:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=VTE5az9jXAZ/GTAJ0HVMKCQLaE9Hs979hVLwdwTkSkU=;
	b=kFhvV6e48icM76XefFjDspT3nrFkYY+PUCIMphaQc+97OrdF/atayHtcWo8acuYnVH
	4NmDvj+PVaiSCRlVraXnRUDODucrzsXCg4PXglsbJKE7UedOiBj+MEjvbluI697qBRJS
	4QOvc71X/lJItm4WlIIU1uPSsMu8j6UvM8PgyxjJc+tgZXUnXB/aW10FoOrMxViRiLxS
	HwAw57i779Cwiq2NW7dqPxVArVkFTSAYYrlL0/UhdCL8aDJElUO/eScnCq0aB1R7hsNu
	2pITTkDzc4k1o5WzGZekQD1MCedf0MAWpbKGHug0By7ey2fRB2DFa1rzsOgBwl/bRxYv
	FssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=VTE5az9jXAZ/GTAJ0HVMKCQLaE9Hs979hVLwdwTkSkU=;
	b=e7jcsnNRdh3sRoaDJtCCTk7XtDQivqKYCMtIed7pstszEKpFHV5YZObY83YyUXvduv
	K25HrmNxn3lFWSLCEOYlMU1mmUmDnKNgpmybwsIkhpInnTwEycpRfTCC0vEFaQVnJU4o
	FA0iV8O5o8cPnYFZ3AscyM+dBXIHS/K0oQzBv1XWlTb2tlNiMNoo0bKWlXUwOiPlsOcY
	Vr/BCtrXqd96juvUGmqUmNzgNOWOuKkuQn17BrbVynyiObWL4JRE4/Vu69aB4mCdg++n
	DXFANC2gKONtkt3P1RaT5WD/5h3PQ6abe8urBeo2ga8vXetGLbxhjtY4JS1JLJtLoPEf
	61Rg==
X-Gm-Message-State: APjAAAWYxiHZmvf0tpznYhJ429X2yvGRMd+7eDAOzYHgA0E+9OJYxcVD
	SWwV4q1JladNSK6+uEPqC0U2rw==
X-Google-Smtp-Source: APXvYqxTAWW+7pmnnBoU60JZDalqhWkKJSQI6jSTubnTX5pk4HZnFygt0x7/41XtD0FkRWw9YXi5Hg==
X-Received: by 2002:a0c:fd91:: with SMTP id p17mr2691538qvr.170.1565977504254; 
	Fri, 16 Aug 2019 10:45:04 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	h26sm3468230qta.58.2019.08.16.10.45.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 10:45:03 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1hygHf-00016W-92; Fri, 16 Aug 2019 14:45:03 -0300
Date: Fri, 16 Aug 2019 14:45:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: DANGER WILL ROBINSON, DANGER
Message-ID: <20190816174503.GK5398@ziepe.ca>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-72-alazar@bitdefender.com>
	<20190809162444.GP5482@bombadil.infradead.org>
	<1565694095.D172a51.28640.@15f23d3a749365d981e968181cce585d2dcb3ffa>
	<20190815191929.GA9253@redhat.com>
	<20190815201630.GA25517@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815201630.GA25517@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>,
	Yu C <yu.c.zhang@intel.com>, kvm@vger.kernel.org,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Samuel =?utf-8?Q?Laur=C3=A9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	virtualization@lists.linux-foundation.org,
	Adalbert =?utf-8?B?TGF6xINy?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Mircea =?utf-8?B?Q8OucmphbGl1?= <mcirjaliu@bitdefender.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDQ6MTY6MzBQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAwMzoxOToyOVBNIC0wNDAwLCBKZXJvbWUg
R2xpc3NlIHdyb3RlOgo+ID4gT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDI6MDE6MzVQTSArMDMw
MCwgQWRhbGJlcnQgTGF6xINyIHdyb3RlOgo+ID4gPiBPbiBGcmksIDkgQXVnIDIwMTkgMDk6MjQ6
NDQgLTA3MDAsIE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+
ID4gPiBPbiBGcmksIEF1ZyAwOSwgMjAxOSBhdCAwNzowMDoyNlBNICswMzAwLCBBZGFsYmVydCBM
YXrEg3Igd3JvdGU6Cj4gPiA+ID4gPiArKysgYi9pbmNsdWRlL2xpbnV4L3BhZ2UtZmxhZ3MuaAo+
ID4gPiA+ID4gQEAgLTQxNyw4ICs0MTcsMTAgQEAgUEFHRUZMQUcoSWRsZSwgaWRsZSwgUEZfQU5Z
KQo+ID4gPiA+ID4gICAqLwo+ID4gPiA+ID4gICNkZWZpbmUgUEFHRV9NQVBQSU5HX0FOT04JMHgx
Cj4gPiA+ID4gPiAgI2RlZmluZSBQQUdFX01BUFBJTkdfTU9WQUJMRQkweDIKPiA+ID4gPiA+ICsj
ZGVmaW5lIFBBR0VfTUFQUElOR19SRU1PVEUJMHg0Cj4gPiA+ID4gCj4gPiA+ID4gVWguICBIb3cg
ZG8geW91IGtub3cgcGFnZS0+bWFwcGluZyB3b3VsZCBvdGhlcndpc2UgaGF2ZSBiaXQgMiBjbGVh
cj8KPiA+ID4gPiBXaG8ncyBndWFyYW50ZWVpbmcgdGhhdD8KPiA+ID4gPiAKPiA+ID4gPiBUaGlz
IGlzIGFuIGF3ZnVsbHkgYmlnIHBhdGNoIHRvIHRoZSBtZW1vcnkgbWFuYWdlbWVudCBjb2RlLCBi
dXJpZWQgaW4KPiA+ID4gPiB0aGUgbWlkZGxlIG9mIGEgZ2lnYW50aWMgc2VyaWVzIHdoaWNoIGFs
bW9zdCBndWFyYW50ZWVzIG5vYm9keSB3b3VsZAo+ID4gPiA+IGxvb2sgYXQgaXQuICBJIGNhbGwg
c2hlbmFuaWdhbnMuCj4gPiA+ID4gCj4gPiA+ID4gPiBAQCAtMTAyMSw3ICsxMDIyLDcgQEAgdm9p
ZCBwYWdlX21vdmVfYW5vbl9ybWFwKHN0cnVjdCBwYWdlICpwYWdlLCBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSkKPiA+ID4gPiA+ICAgKiBfX3BhZ2Vfc2V0X2Fub25fcm1hcCAtIHNldCB1cCBu
ZXcgYW5vbnltb3VzIHJtYXAKPiA+ID4gPiA+ICAgKiBAcGFnZToJUGFnZSBvciBIdWdlcGFnZSB0
byBhZGQgdG8gcm1hcAo+ID4gPiA+ID4gICAqIEB2bWE6CVZNIGFyZWEgdG8gYWRkIHBhZ2UgdG8u
Cj4gPiA+ID4gPiAtICogQGFkZHJlc3M6CVVzZXIgdmlydHVhbCBhZGRyZXNzIG9mIHRoZSBtYXBw
aW5nCQo+ID4gPiA+ID4gKyAqIEBhZGRyZXNzOglVc2VyIHZpcnR1YWwgYWRkcmVzcyBvZiB0aGUg
bWFwcGluZwo+ID4gPiA+IAo+ID4gPiA+IEFuZCBtaXhpbmcgaW4gZmx1ZmYgY2hhbmdlcyBsaWtl
IHRoaXMgaXMgYSByZWFsIG5vLW5vLiAgVHJ5IGFnYWluLgo+ID4gPiA+IAo+ID4gPiAKPiA+ID4g
Tm8gYmFkIGludGVudGlvbnMsIGp1c3Qgb3ZlcnplYWxvdXMuCj4gPiA+IEkgZGlkbid0IHdhbnQg
dG8gaGlkZSBhbnl0aGluZyBmcm9tIG91ciBwYXRjaGVzLgo+ID4gPiBPbmNlIHdlIGFkdmFuY2Ug
d2l0aCB0aGUgaW50cm9zcGVjdGlvbiBwYXRjaGVzIHJlbGF0ZWQgdG8gS1ZNIHdlJ2xsIGJlCj4g
PiA+IGJhY2sgd2l0aCB0aGUgcmVtb3RlIG1hcHBpbmcgcGF0Y2gsIHNwbGl0IGFuZCBjbGVhbmVk
Lgo+ID4gCj4gPiBUaGV5IGFyZSBub3QgYml0IGxlZnQgaW4gc3RydWN0IHBhZ2UgISBMb29raW5n
IGF0IHRoZSBwYXRjaCBpdCBzZWVtcwo+ID4geW91IHdhbnQgdG8gaGF2ZSB5b3VyIG93biBwaW4g
Y291bnQganVzdCBmb3IgS1ZNLiBUaGlzIGlzIGJhZCwgd2UgYXJlCj4gPiBhbHJlYWR5IHRyeWlu
ZyB0byBzb2x2ZSB0aGUgR1VQIHRoaW5nIChzZWUgYWxsIHZhcmlvdXMgcGF0Y2hzZXQgYWJvdXQK
PiA+IEdVUCBwb3N0ZWQgcmVjZW50bHkpLgo+ID4gCj4gPiBZb3UgbmVlZCB0byByZXRoaW5rIGhv
dyB5b3Ugd2FudCB0byBhY2hpZXZlIHRoaXMuIFdoeSBub3Qgc2ltcGx5IGEKPiA+IHJlbW90ZSBy
ZWFkKCkvd3JpdGUoKSBpbnRvIHRoZSBwcm9jZXNzIG1lbW9yeSBpZSBLVk1JIHdvdWxkIGNhbGwK
PiA+IGFuIGlvY3RsIHRoYXQgYWxsb3cgdG8gcmVhZCBvciB3cml0ZSBpbnRvIGEgcmVtb3RlIHBy
b2Nlc3MgbWVtb3J5Cj4gPiBsaWtlIHB0cmFjZSgpIGJ1dCBvbiBzdGVyb2lkIC4uLgo+ID4gCj4g
PiBBZGRpbmcgdGhpcyB3aG9sZSBiaWcgY29tcGxleCBpbmZyYXN0cnVjdHVyZSB3aXRob3V0IGp1
c3RpZmljYXRpb24KPiA+IG9mIHdoeSB3ZSBuZWVkIHRvIGF2b2lkIHJvdW5kIHRyaXAgaXMganVz
dCB0b28gbXVjaCByZWFsbHkuCj4gCj4gVGhpbmtpbmcgYSBiaXQgbW9yZSBhYm91dCB0aGlzLCB5
b3UgY2FuIGFjaGlldmUgdGhlIHNhbWUgdGhpbmcgd2l0aG91dAo+IGFkZGluZyBhIHNpbmdsZSBs
aW5lIHRvIGFueSBtbSBjb2RlLiBJbnN0ZWFkIG9mIGhhdmluZyBtbWFwIHdpdGgKPiBQUk9UX05P
TkUgfCBNQVBfTE9DS0VEIHlvdSBoYXZlIHVzZXJzcGFjZSBtbWFwIHNvbWUga3ZtIGRldmljZSBm
aWxlCj4gKGkgYW0gYXNzdW1pbmcgdGhpcyBpcyBzb21ldGhpbmcgeW91IGFscmVhZHkgaGF2ZSBh
bmQgY2FuIGNvbnRyb2wKPiB0aGUgbW1hcCBjYWxsYmFjaykuCj4gCj4gU28gbm93IGtlcm5lbCBz
aWRlIHlvdSBoYXZlIGEgdm1hIHdpdGggYSB2bV9vcGVyYXRpb25zX3N0cnVjdCB1bmRlcgo+IHlv
dXIgY29udHJvbCB0aGlzIG1lYW5zIHRoYXQgZXZlcnl0aGluZyB5b3Ugd2FudCB0byBibG9jayBt
bSB3aXNlCj4gZnJvbSB3aXRoaW4gdGhlIGluc3BlY3RvciBwcm9jZXNzIGNhbiBiZSBibG9jayB0
aHJvdWdoIHRob3NlIGNhbGwtCj4gYmFja3MgKGZpbmRfc3BlY2lhbF9wYWdlKCkgc3BlY2lmaWNh
bHkgZm9yIHdoaWNoIHlvdSBoYXZlIHRvIHJldHVybgo+IE5VTEwgYWxsIHRoZSB0aW1lKS4KCkkn
bSBhY3R1YWxseSBhd2FyZSBvZiBhIGNvdXBsZSBvZiB1c2UgY2FzZXMgdGhhdCB3b3VsZCBsaWtl
IHRvCm1pcnJvciB0aGUgVkEgb2Ygb25lIHByb2Nlc3MgaW50byBhbm90aGVyLiBPbmUgYmlnIG9u
ZSBpbiB0aGUgSFBDCndvcmxkIGlzIHRoZSBvdXQgb2YgdHJlZSAneHBtZW0nIHN0aWxsIGluIHdp
ZGUgdXNlIHRvZGF5LiB4cG1lbSBpcwpiYXNpY2FsbHkgd2hhdCBKZXJvbWUgZGVzY3JpYmVkIGFi
b3ZlLgoKSWYgeW91IGRvIGFuIGFwcHJvYWNoIGxpa2UgSmVyb21lIGRlc2NyaWJlcyBpdCB3b3Vs
ZCBiZSBuaWNlIGlmIHdhcyBhCmdlbmVyYWwgZmFjaWxpdHkgYW5kIG5vdCBidXJpZWQgaW4ga3Zt
LgoKSSBrbm93IHBhc3QgeHBtZW0gYWR2ZW50dXJlcyByYW4gaW50byB0cm91YmxlIHdpdGggbG9j
a2luZy9ldGMgLSBpZQpnZXR0aW5nIHRoZSBtbV9zdHJ1Y3Qgb2YgdGhlIHZpY3RpbSBzZWVtZWQg
YSBiaXQgaGFyZCBmb3Igc29tZSByZWFzb24sCmJ1dCBtYXliZSB0aGF0IGNvdWxkIGJlIGRvbmUg
d2l0aCBhIEZEIHBhc3MgJ2lvY3RsKEkgQU0gVEhFIFZJQ0lUTSknID8KCkphc29uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
