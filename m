Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4C68124F
	for <lists.virtualization@lfdr.de>; Mon,  5 Aug 2019 08:28:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9E086B88;
	Mon,  5 Aug 2019 06:28:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4AAABB49
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 06:28:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AB26E8A9
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 06:28:23 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id x22so6509564qtp.12
	for <virtualization@lists.linux-foundation.org>;
	Sun, 04 Aug 2019 23:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=KWA/zRel4261JwzY6PT0mEAQMawH9MJ6QOovbW+PtWw=;
	b=hiBvlOwOXSTWtpKfOq0K9pROAkH55j7IcJ/DRqNbfSo9skZS+2sHVCLK/u6JW3do0m
	HOFc6WuxawZ0jiyYXAAaw0BMfttO7cv85fx0aBoKqKl4mh4iJAB27UBwOAHoxZDGw6qH
	Xbc0v6CBCgBdyKO7Uf8GRCE7L4vNLefcWguE8zKBjfWtYRcN7h/CRFbd3jGEevAfWdlN
	qRmLh+/TEqOZehjxJZEYfYrG5kCOrCPHbakviqEOLdHlx4iZu+M6jPMhIIoPP1g7W8ip
	wTXMbdaEGc8/MeerHvEc42NvOissytPlDOCelTzuNACmrYGE2UQKhqeCiFtu7yPG8RGi
	MVsA==
X-Gm-Message-State: APjAAAV9p+hSy2qhbYr+HD7BZPYljblX/+fMgf3VlwvT22pefVyGttIC
	q5/ATwoyCO95QSA9hTYBNbhx/w==
X-Google-Smtp-Source: APXvYqxmlaPhRV6WcTX7MFxiXlbHz2huG6EImOc41/XnvtSvCJPv0MiUiy9pupzwZ++qXjlc9yUxxA==
X-Received: by 2002:ad4:4a14:: with SMTP id m20mr5317024qvz.58.1564986502769; 
	Sun, 04 Aug 2019 23:28:22 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	q56sm42239382qtq.64.2019.08.04.23.28.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 04 Aug 2019 23:28:21 -0700 (PDT)
Date: Mon, 5 Aug 2019 02:28:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190805020752-mutt-send-email-mst@kernel.org>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802094331-mutt-send-email-mst@kernel.org>
	<6c3a0a1c-ce87-907b-7bc8-ec41bf9056d8@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c3a0a1c-ce87-907b-7bc8-ec41bf9056d8@redhat.com>
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

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMTI6MzM6NDVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzgvMiDkuIvljYgxMDowMywgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDU6NDA6MDdQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gQnR3LCBJIGNvbWUgdXAgYW5vdGhlciBpZGVhLCB0aGF0IGlzIHRvIGRp
c2FibGUgcHJlZW1wdGlvbiB3aGVuIHZob3N0IHRocmVhZAo+ID4gPiBuZWVkIHRvIGFjY2VzcyB0
aGUgbWVtb3J5LiBUaGVuIHJlZ2lzdGVyIHByZWVtcHQgbm90aWZpZXIgYW5kIGlmIHZob3N0Cj4g
PiA+IHRocmVhZCBpcyBwcmVlbXB0ZWQsIHdlJ3JlIHN1cmUgbm8gb25lIHdpbGwgYWNjZXNzIHRo
ZSBtZW1vcnkgYW5kIGNhbiBkbyB0aGUKPiA+ID4gY2xlYW51cC4KPiA+IEdyZWF0LCBtb3JlIG5v
dGlmaWVycyA6KAo+ID4gCj4gPiBNYXliZSBjYW4gbGl2ZSB3aXRoCj4gPiAxLSBkaXNhYmxlIHBy
ZWVtcHRpb24gd2hpbGUgdXNpbmcgdGhlIGNhY2hlZCBwb2ludGVyCj4gPiAyLSB0ZWFjaCB2aG9z
dCB0byByZWNvdmVyIGZyb20gbWVtb3J5IGFjY2VzcyBmYWlsdXJlcywKPiA+ICAgICBieSBzd2l0
Y2hpbmcgdG8gcmVndWxhciBmcm9tL3RvIHVzZXIgcGF0aAo+IAo+IAo+IEkgZG9uJ3QgZ2V0IHRo
aXMsIEkgYmVsaWV2ZSB3ZSB3YW50IHRvIHJlY292ZXIgZnJvbSByZWd1bGFyIGZyb20vdG8gdXNl
cgo+IHBhdGgsIGlzbid0IGl0PwoKVGhhdCAoZGlzYWJsZSBjb3B5IHRvL2Zyb20gdXNlciBjb21w
bGV0ZWx5KSB3b3VsZCBiZSBhIG5pY2UgdG8gaGF2ZQpzaW5jZSBpdCB3b3VsZCByZWR1Y2UgdGhl
IGF0dGFjayBzdXJmYWNlIG9mIHRoZSBkcml2ZXIsIGJ1dCBlLmcuIHlvdXIKY29kZSBhbHJlYWR5
IGRvZXNuJ3QgZG8gdGhhdC4KCgoKPiAKPiA+IAo+ID4gU28gaWYgeW91IHdhbnQgdG8gdHJ5IHRo
YXQsIGZpbmUgc2luY2UgaXQncyBhIHN0ZXAgaW4KPiA+IHRoZSByaWdodCBkaXJlY3Rpb24uCj4g
PiAKPiA+IEJ1dCBJIHRoaW5rIGZ1bmRhbWVudGFsbHkgaXQncyBub3Qgd2hhdCB3ZSB3YW50IHRv
IGRvIGxvbmcgdGVybS4KPiAKPiAKPiBZZXMuCj4gCj4gCj4gPiAKPiA+IEl0J3MgYWx3YXlzIGJl
ZW4gYSBmdW5kYW1lbnRhbCBwcm9ibGVtIHdpdGggdGhpcyBwYXRjaCBzZXJpZXMgdGhhdCBvbmx5
Cj4gPiBtZXRhZGF0YSBpcyBhY2Nlc3NlZCB0aHJvdWdoIGEgZGlyZWN0IHBvaW50ZXIuCj4gPiAK
PiA+IFRoZSBkaWZmZXJlbmNlIGluIHdheXMgeW91IGhhbmRsZSBtZXRhZGF0YSBhbmQgZGF0YSBp
cyB3aGF0IGlzCj4gPiBub3cgY29taW5nIGFuZCBtZXNzaW5nIGV2ZXJ5dGhpbmcgdXAuCj4gCj4g
Cj4gSSBkbyBwcm9wb3NlIHNvZW10aGluZyBsaWtlIHRoaXMgaW4gdGhlIHBhc3Q6Cj4gaHR0cHM6
Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtdmlydHVhbGl6YXRpb24vbXNnMzY4MjQuaHRt
bC4gQnV0IGxvb2tzCj4gbGlrZSB5b3UgaGF2ZSBzb21lIGNvbmNlcm4gYWJvdXQgaXRzIGxvY2Fs
aXR5LgoKUmlnaHQgYW5kIGl0IGRvZXNuJ3QgZ28gYXdheS4gWW91J2xsIG5lZWQgdG8gY29tZSB1
cAp3aXRoIGEgdGVzdCB0aGF0IG1lc3NlcyBpdCB1cCBhbmQgdHJpZ2dlcnMgYSB3b3JzdC1jYXNl
CnNjZW5hcmlvLCBzbyB3ZSBjYW4gbWVhc3VyZSBob3cgYmFkIGlzIHRoYXQgd29yc3QtY2FzZS4K
Cj4gQnV0IHRoZSBwcm9ibGVtIHN0aWxsIHRoZXJlLCBHVVAgY2FuIGRvIHBhZ2UgZmF1bHQsIHNv
IHN0aWxsIG5lZWQgdG8KPiBzeW5jaHJvbml6ZSBpdCB3aXRoIE1NVSBub3RpZmllcnMuCgpJIHRo
aW5rIHRoZSBpZGVhIHdhcywgaWYgR1VQIHdvdWxkIG5lZWQgYSBwYWdlZmF1bHQsIGRvbid0CmRv
IGEgR1VQIGFuZCBkbyB0by9mcm9tIHVzZXIgaW5zdGVhZC4gSG9wZWZ1bGx5IHRoYXQKd2lsbCBm
YXVsdCB0aGUgcGFnZSBpbiBhbmQgdGhlIG5leHQgYWNjZXNzIHdpbGwgZ28gdGhyb3VnaC4KCj4g
VGhlIHNvbHV0aW9uIG1pZ2h0IGJlIHNvbWV0aGluZyBsaWtlCj4gbW92aW5nIEdVUCB0byBhIGRl
ZGljYXRlZCBraW5kIG9mIHZob3N0IHdvcmsuCgpSaWdodCwgZ2VuZXJhbGx5IEdVUC4KCj4gCj4g
PiAKPiA+IFNvIGlmIGNvbnRpbnVpbmcgdGhlIGRpcmVjdCBtYXAgYXBwcm9hY2gsCj4gPiB3aGF0
IGlzIG5lZWRlZCBpcyBhIGNhY2hlIG9mIG1hcHBlZCBWTSBtZW1vcnksIHRoZW4gb24gYSBjYWNo
ZSBtaXNzCj4gPiB3ZSdkIHF1ZXVlIHdvcmsgYWxvbmcgdGhlIGxpbmVzIG9mIDEtMiBhYm92ZS4K
PiA+IAo+ID4gVGhhdCdzIG9uZSBkaXJlY3Rpb24gdG8gdGFrZS4gQW5vdGhlciBvbmUgaXMgdG8g
Z2l2ZSB1cCBvbiB0aGF0IGFuZAo+ID4gd3JpdGUgb3VyIG93biB2ZXJzaW9uIG9mIHVhY2Nlc3Mg
bWFjcm9zLiAgQWRkIGEgImhpZ2ggc2VjdXJpdHkiIGZsYWcgdG8KPiA+IHRoZSB2aG9zdCBtb2R1
bGUgYW5kIGlmIG5vdCBhY3RpdmUgdXNlIHRoZXNlIGZvciB1c2Vyc3BhY2UgbWVtb3J5Cj4gPiBh
Y2Nlc3MuCj4gCj4gCj4gT3IgdXNpbmcgU0VUX0JBQ0tFTkRfRkVBVFVSRVM/CgpObywgSSBkb24n
dCB0aGluayBpdCdzIGNvbnNpZGVyZWQgYmVzdCBwcmFjdGljZSB0byBhbGxvdyB1bnByaXZlbGVk
Z2VkCnVzZXJzcGFjZSBjb250cm9sIG92ZXIgd2hldGhlciBrZXJuZWwgZW5hYmxlcyBzZWN1cml0
eSBmZWF0dXJlcy4KCj4gQnV0IGRvIHlvdSBtZWFuIHBlcm1hbmVudCBHVVAgYXMgSSBkaWQgaW4K
PiBvcmlnaW5hbCBSRkMgaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvMTIvMTMvMjE4Pwo+IAo+
IFRoYW5rcwoKUGVybWFuZW50IEdVUCBicmVha3MgVEhQIGFuZCBOVU1BLgoKPiA+IAo+ID4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
