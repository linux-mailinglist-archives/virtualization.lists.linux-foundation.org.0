Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF8F3ADC2
	for <lists.virtualization@lfdr.de>; Mon, 10 Jun 2019 05:51:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 19E45C74;
	Mon, 10 Jun 2019 03:51:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0DDBCC5D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 03:50:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A69DB775
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 03:50:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9A5D3082B15;
	Mon, 10 Jun 2019 03:50:57 +0000 (UTC)
Received: from [10.72.12.206] (ovpn-12-206.pek2.redhat.com [10.72.12.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AB5660BEC;
	Mon, 10 Jun 2019 03:50:46 +0000 (UTC)
Subject: Re: [PATCH net-next 0/6] vhost: accelerate metadata access
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190524081218.2502-1-jasowang@redhat.com>
	<20190605162631-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c233324c-cb66-c0ab-45c4-6e6e0499bb22@redhat.com>
Date: Mon, 10 Jun 2019 11:50:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605162631-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 10 Jun 2019 03:50:58 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: hch@infradead.org, linux-parisc@vger.kernel.org, kvm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	James.Bottomley@hansenpartnership.com, linux-mm@kvack.org,
	jglisse@redhat.com, jrdr.linux@gmail.com, davem@davemloft.net,
	linux-arm-kernel@lists.infradead.org, christophe.de.dinechin@gmail.com
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

Ck9uIDIwMTkvNi82IOS4iuWNiDQ6MjcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBG
cmksIE1heSAyNCwgMjAxOSBhdCAwNDoxMjoxMkFNIC0wNDAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBIaToKPj4KPj4gVGhpcyBzZXJpZXMgdHJpZXMgdG8gYWNjZXNzIHZpcnRxdWV1ZSBtZXRhZGF0
YSB0aHJvdWdoIGtlcm5lbCB2aXJ0dWFsCj4+IGFkZHJlc3MgaW5zdGVhZCBvZiBjb3B5X3VzZXIo
KSBmcmllbmRzIHNpbmNlIHRoZXkgaGFkIHRvbyBtdWNoCj4+IG92ZXJoZWFkcyBsaWtlIGNoZWNr
cywgc3BlYyBiYXJyaWVycyBvciBldmVuIGhhcmR3YXJlIGZlYXR1cmUKPj4gdG9nZ2xpbmcgbGlr
ZSBTTUFQLiBUaGlzIGlzIGRvbmUgdGhyb3VnaCBzZXR1cCBrZXJuZWwgYWRkcmVzcyB0aHJvdWdo
Cj4+IGRpcmVjdCBtYXBwaW5nIGFuZCBjby1vcHJlYXRlIFZNIG1hbmFnZW1lbnQgd2l0aCBNTVUg
bm90aWZpZXJzLgo+Pgo+PiBUZXN0IHNob3dzIGFib3V0IDIzJSBpbXByb3ZlbWVudCBvbiBUWCBQ
UFMuIFRDUF9TVFJFQU0gZG9lc24ndCBzZWUKPj4gb2J2aW91cyBpbXByb3ZlbWVudC4KPj4KPj4g
VGhhbmtzCj4gVGhhbmtzIHRoaXMgaXMgcXVldWVkIGZvciBuZXh0Lgo+Cj4gRGlkIHlvdSB3YW50
IHRvIHJlYmFzZSBhbmQgcmVwb3N0IHBhY2tlZCByaW5nIHN1cHBvcnQgb24gdG9wPwo+IElJVUMg
aXQncyBvbiBwYXIgd2l0aCBzcGxpdCByaW5nIHdpdGggdGhlc2UgcGF0Y2hlcy4KPgo+CgpZZXMs
IGl0J3Mgb24gdGhlIHdheS4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
