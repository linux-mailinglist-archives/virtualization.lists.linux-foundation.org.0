Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CD033AB546
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 12:03:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 195051E90;
	Fri,  6 Sep 2019 10:03:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2F3C71E82
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:02:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E0151756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 10:02:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F96D85A03;
	Fri,  6 Sep 2019 10:02:57 +0000 (UTC)
Received: from [10.72.12.16] (ovpn-12-16.pek2.redhat.com [10.72.12.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B06F960A97;
	Fri,  6 Sep 2019 10:02:45 +0000 (UTC)
Subject: Re: [PATCH 0/2] Revert and rework on the metadata accelreation
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20190905122736.19768-1-jasowang@redhat.com>
	<20190905135907.GB6011@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7785d39b-b4e7-8165-516c-ee6a08ac9c4e@redhat.com>
Date: Fri, 6 Sep 2019 18:02:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905135907.GB6011@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 06 Sep 2019 10:02:57 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "aarcange@redhat.com" <aarcange@redhat.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"mst@redhat.com" <mst@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"jglisse@redhat.com" <jglisse@redhat.com>
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

Ck9uIDIwMTkvOS81IOS4i+WNiDk6NTksIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBUaHUs
IFNlcCAwNSwgMjAxOSBhdCAwODoyNzozNFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiBI
aToKPj4KPj4gUGVyIHJlcXVlc3QgZnJvbSBNaWNoYWVsIGFuZCBKYXNvbiwgdGhlIG1ldGFkYXRh
IGFjY2VscmVhdGlvbiBpcwo+PiByZXZlcnRlZCBpbiB0aGlzIHZlcnNpb24gYW5kIHJld29yayBp
biBuZXh0IHZlcnNpb24uCj4+Cj4+IFBsZWFzZSByZXZpZXcuCj4+Cj4+IFRoYW5rcwo+Pgo+PiBK
YXNvbiBXYW5nICgyKToKPj4gICAgUmV2ZXJ0ICJ2aG9zdDogYWNjZXNzIHZxIG1ldGFkYXRhIHRo
cm91Z2gga2VybmVsIHZpcnR1YWwgYWRkcmVzcyIKPj4gICAgdmhvc3Q6IHJlLWludHJvZHVjaW5n
IG1ldGFkYXRhIGFjY2VsZXJhdGlvbiB0aHJvdWdoIGtlcm5lbCB2aXJ0dWFsCj4+ICAgICAgYWRk
cmVzcwo+IFRoZXJlIGFyZSBhIGJ1bmNoIG9mIHBhdGNoZXMgaW4gdGhlIHF1ZXVlIGFscmVhZHkg
dGhhdCB3aWxsIGhlbHAKPiB2aG9zdCwgYW5kIEkgYSB3b3JraW5nIG9uIG9uZSBmb3IgbmV4dCBj
eWNsZSB0aGF0IHdpbGwgaGVscCBhbG90IG1vcmUKPiB0b28uCgoKSSB3aWxsIGNoZWNrIHRob3Nl
IHBhdGNoZXMsIGJ1dCBpZiB5b3UgY2FuIGdpdmUgbWUgc29tZSBwb2ludGVycyBvciAKa2V5d29y
ZHMgaXQgd291bGQgYmUgbXVjaCBhcHByZWNpYXRlZC4KCgo+Cj4gSSB0aGluayB5b3Ugc2hvdWxk
IGFwcGx5IHRoZSByZXZlcnQgdGhpcyBjeWNsZSBhbmQgcmViYXNlIHRoZSBvdGhlcgo+IHBhdGNo
IGZvciBuZXh0Li4KPgo+IEphc29uCgoKWWVzLCB0aGUgcGxhbiBpcyB0byByZXZlcnQgaW4gdGhp
cyByZWxlYXNlIGN5Y2xlLgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
