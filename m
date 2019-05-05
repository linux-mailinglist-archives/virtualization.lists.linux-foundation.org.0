Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 425B413EA6
	for <lists.virtualization@lfdr.de>; Sun,  5 May 2019 11:21:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 96F794366;
	Sun,  5 May 2019 09:21:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 680D54366
	for <virtualization@lists.linux-foundation.org>;
	Sun,  5 May 2019 09:20:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 11C1DFD
	for <virtualization@lists.linux-foundation.org>;
	Sun,  5 May 2019 09:20:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50F6C3091749;
	Sun,  5 May 2019 09:20:42 +0000 (UTC)
Received: from [10.72.12.197] (ovpn-12-197.pek2.redhat.com [10.72.12.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC3AF5DA5B;
	Sun,  5 May 2019 09:20:32 +0000 (UTC)
Subject: Re: [RFC PATCH V3 0/6] vhost: accelerate metadata access
To: mst@redhat.com, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20190423055420.26408-1-jasowang@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <831c343f-c547-f68c-19fe-d89e8f259d87@redhat.com>
Date: Sun, 5 May 2019 17:20:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190423055420.26408-1-jasowang@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Sun, 05 May 2019 09:20:42 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: aarcange@redhat.com, hch@infradead.org, christophe.de.dinechin@gmail.com,
	linux-parisc@vger.kernel.org,
	James.Bottomley@hansenpartnership.com, linux-mm@kvack.org,
	jglisse@redhat.com, jrdr.linux@gmail.com, davem@davemloft.net,
	linux-arm-kernel@lists.infradead.org
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

Ck9uIDIwMTkvNC8yMyDkuIvljYgxOjU0LCBKYXNvbiBXYW5nIHdyb3RlOgo+IFRoaXMgc2VyaWVz
IHRyaWVzIHRvIGFjY2VzcyB2aXJ0cXVldWUgbWV0YWRhdGEgdGhyb3VnaCBrZXJuZWwgdmlydHVh
bAo+IGFkZHJlc3MgaW5zdGVhZCBvZiBjb3B5X3VzZXIoKSBmcmllbmRzIHNpbmNlIHRoZXkgaGFk
IHRvbyBtdWNoCj4gb3ZlcmhlYWRzIGxpa2UgY2hlY2tzLCBzcGVjIGJhcnJpZXJzIG9yIGV2ZW4g
aGFyZHdhcmUgZmVhdHVyZQo+IHRvZ2dsaW5nLiBUaGlzIGlzIGRvbmUgdGhyb3VnaCBzZXR1cCBr
ZXJuZWwgYWRkcmVzcyB0aHJvdWdoIGRpcmVjdAo+IG1hcHBpbmcgYW5kIGNvLW9wcmVhdGUgVk0g
bWFuYWdlbWVudCB3aXRoIE1NVSBub3RpZmllcnMuCj4KPiBUZXN0IHNob3dzIGFib3V0IDIzJSBp
bXByb3ZlbWVudCBvbiBUWCBQUFMuIFRDUF9TVFJFQU0gZG9lc24ndCBzZWUKPiBvYnZpb3VzIGlt
cHJvdmVtZW50LgoKClBpbmcuIENvbW1lbnRzIGFyZSBtb3JlIHRoYW4gd2VsY29tZWQuCgpUaGFu
a3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
