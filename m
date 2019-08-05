Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B9F81259
	for <lists.virtualization@lfdr.de>; Mon,  5 Aug 2019 08:30:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 263DBB59;
	Mon,  5 Aug 2019 06:30:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5CF85B59
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 06:30:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E446A8A9
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 06:30:40 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id d79so59222428qke.11
	for <virtualization@lists.linux-foundation.org>;
	Sun, 04 Aug 2019 23:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=PVqIsmchklCTrdzugsyQL+AeUL8kmqaAFQiz9HKaITE=;
	b=jqdxT489tMLNkuU+droaKXsxZQiDrVcmTMkRHsOUAOPn5Z+xM61ST53DvRDhAEDwZN
	UbcUxG7NSSeX5iql2CX2zkNzudLIux1psRvYxrgJd6sNnrwNfvhrJMlsHAYrr3AfrCNj
	1ubqDoezdDR4PFSN0M/XxQqRiaEvd0l/WhZOOIGB6+z/v26cgY+I5pV70x8QABniSjYG
	VXSfH/kPp4bt0tlvwUNCCyEMjbDwxRFFXapyfAoBXgsfDHCsb8dLIzAm0LiJ7BqxkT3y
	5x80Pvp5y98J7QmFbswtTbA85nocbBx5ESakr8Y7yZS7DfhJLYF0uclRDh72idSgXaZG
	KZkQ==
X-Gm-Message-State: APjAAAXNqTyCSLV4B47+nCK57xT7txCOnq6oy0F+S8MB6075jIE3DKQM
	riDyWTR2J4n0jyshNZkeZKvDjg==
X-Google-Smtp-Source: APXvYqwS0Eo1lXfnBu6u3xqFFZLty3hYj+avFeIYmNSdIaVzfHVVLe9QhqalA5xTV3YZrONCooErvg==
X-Received: by 2002:a37:86c4:: with SMTP id
	i187mr100882695qkd.464.1564986640071; 
	Sun, 04 Aug 2019 23:30:40 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	n3sm34029874qkk.54.2019.08.04.23.30.36
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 04 Aug 2019 23:30:39 -0700 (PDT)
Date: Mon, 5 Aug 2019 02:30:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190805022833-mutt-send-email-mst@kernel.org>
References: <20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
	<20190802100414-mutt-send-email-mst@kernel.org>
	<e8ecb811-6653-cff4-bc11-81f4ccb0dbbf@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8ecb811-6653-cff4-bc11-81f4ccb0dbbf@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, netdev@vger.kernel.org,
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

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMTI6MzY6NDBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzgvMiDkuIvljYgxMDoyNywgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDk6NDY6MTNBTSAtMDMwMCwgSmFzb24gR3Vu
dGhvcnBlIHdyb3RlOgo+ID4gPiBPbiBGcmksIEF1ZyAwMiwgMjAxOSBhdCAwNTo0MDowN1BNICsw
ODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gVGhpcyBtdXN0IGJlIGEgcHJvcGVyIGJh
cnJpZXIsIGxpa2UgYSBzcGlubG9jaywgbXV0ZXgsIG9yCj4gPiA+ID4gPiBzeW5jaHJvbml6ZV9y
Y3UuCj4gPiA+ID4gCj4gPiA+ID4gSSBzdGFydCB3aXRoIHN5bmNocm9uaXplX3JjdSgpIGJ1dCBi
b3RoIHlvdSBhbmQgTWljaGFlbCByYWlzZSBzb21lCj4gPiA+ID4gY29uY2Vybi4KPiA+ID4gSSd2
ZSBhbHNvIGlkbHkgd29uZGVyZWQgaWYgY2FsbGluZyBzeW5jaHJvbml6ZV9yY3UoKSB1bmRlciB0
aGUgdmFyaW91cwo+ID4gPiBtbSBsb2NrcyBpcyBhIGRlYWRsb2NrIHNpdHVhdGlvbi4KPiA+ID4g
Cj4gPiA+ID4gVGhlbiBJIHRyeSBzcGlubG9jayBhbmQgbXV0ZXg6Cj4gPiA+ID4gCj4gPiA+ID4g
MSkgc3BpbmxvY2s6IGFkZCBsb3RzIG9mIG92ZXJoZWFkIG9uIGRhdGFwYXRoLCB0aGlzIGxlYWRz
IDAgcGVyZm9ybWFuY2UKPiA+ID4gPiBpbXByb3ZlbWVudC4KPiA+ID4gSSB0aGluayB0aGUgdG9w
aWMgaGVyZSBpcyBjb3JyZWN0bmVzcyBub3QgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQKPiA+IFRo
ZSB0b3BpYyBpcyB3aGV0aGVyIHdlIHNob3VsZCByZXZlcnQKPiA+IGNvbW1pdCA3ZjQ2NjAzMmRj
OSAoInZob3N0OiBhY2Nlc3MgdnEgbWV0YWRhdGEgdGhyb3VnaCBrZXJuZWwgdmlydHVhbCBhZGRy
ZXNzIikKPiA+IAo+ID4gb3Iga2VlcCBpdCBpbi4gVGhlIG9ubHkgcmVhc29uIHRvIGtlZXAgaXQg
aXMgcGVyZm9ybWFuY2UuCj4gCj4gCj4gTWF5YmUgaXQncyB0aW1lIHRvIGludHJvZHVjZSB0aGUg
Y29uZmlnIG9wdGlvbj8KCkRlcGVuZGluZyBvbiBDT05GSUdfQlJPS0VOPyBJJ20gbm90IHN1cmUg
aXQncyBhIGdvb2QgaWRlYS4KCj4gCj4gPiAKPiA+IE5vdyBhcyBsb25nIGFzIGFsbCB0aGlzIGNv
ZGUgaXMgZGlzYWJsZWQgYW55d2F5LCB3ZSBjYW4gZXhwZXJpbWVudCBhCj4gPiBiaXQuCj4gPiAK
PiA+IEkgcGVyc29uYWxseSBmZWVsIHdlIHdvdWxkIGJlIGJlc3Qgc2VydmVkIGJ5IGhhdmluZyB0
d28gY29kZSBwYXRoczoKPiA+IAo+ID4gLSBBY2Nlc3MgdG8gVk0gbWVtb3J5IGRpcmVjdGx5IG1h
cHBlZCBpbnRvIGtlcm5lbAo+ID4gLSBBY2Nlc3MgdG8gdXNlcnNwYWNlCj4gPiAKPiA+IAo+ID4g
SGF2aW5nIGl0IGFsbCBjbGVhbmx5IHNwbGl0IHdpbGwgYWxsb3cgYSBidW5jaCBvZiBvcHRpbWl6
YXRpb25zLCBmb3IKPiA+IGV4YW1wbGUgZm9yIHllYXJzIG5vdyB3ZSBwbGFubmVkIHRvIGJlIGFi
bGUgdG8gcHJvY2VzcyBhbiBpbmNvbWluZyBzaG9ydAo+ID4gcGFja2V0IGRpcmVjdGx5IG9uIHNv
ZnRpcnEgcGF0aCwgb3IgYW4gb3V0Z29pbmcgb24gZGlyZWN0bHkgd2l0aGluCj4gPiBldmVudGZk
Lgo+IAo+IAo+IEl0J3Mgbm90IGhhcmQgY29uc2lkZXIgd2UndmUgYWxyZWFkeSBoYWQgb3VyIG93
biBhY2Nzc29ycy4gQnV0IHRoZSBxdWVzdGlvbgo+IGlzIChhcyBhc2tlZCBpbiBhbm90aGVyIHRo
cmVhZCksIGRvIHlvdSB3YW50IHBlcm1hbmVudCBHVVAgb3Igc3RpbGwgdXNlIE1NVQo+IG5vdGlm
aWVycy4KPiAKPiBUaGFua3MKCldlIHdhbnQgVEhQIGFuZCBOVU1BIHRvIHdvcmsuIEJvdGggYXJl
IGltcG9ydGFudCBmb3IgcGVyZm9ybWFuY2UuCgotLSAKTVNUCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
