Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A41AD1EA
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 04:29:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5E006B6C;
	Mon,  9 Sep 2019 02:29:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 00D55B50
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 02:29:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 988E26D6
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 02:29:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18DD8309DEEA;
	Mon,  9 Sep 2019 02:29:20 +0000 (UTC)
Received: from [10.72.12.61] (ovpn-12-61.pek2.redhat.com [10.72.12.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC5F760A9D;
	Mon,  9 Sep 2019 02:29:06 +0000 (UTC)
Subject: Re: [PATCH 0/2] Revert and rework on the metadata accelreation
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20190905122736.19768-1-jasowang@redhat.com>
	<20190905135907.GB6011@mellanox.com>
	<7785d39b-b4e7-8165-516c-ee6a08ac9c4e@redhat.com>
	<20190907150330.GC2940@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bc1da56e-6256-51a4-57f7-9080099021fb@redhat.com>
Date: Mon, 9 Sep 2019 10:29:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190907150330.GC2940@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 09 Sep 2019 02:29:20 +0000 (UTC)
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

Ck9uIDIwMTkvOS83IOS4i+WNiDExOjAzLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gRnJp
LCBTZXAgMDYsIDIwMTkgYXQgMDY6MDI6MzVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
T24gMjAxOS85LzUg5LiL5Y2IOTo1OSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+Pj4gT24gVGh1
LCBTZXAgMDUsIDIwMTkgYXQgMDg6Mjc6MzRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+
PiBIaToKPj4+Pgo+Pj4+IFBlciByZXF1ZXN0IGZyb20gTWljaGFlbCBhbmQgSmFzb24sIHRoZSBt
ZXRhZGF0YSBhY2NlbHJlYXRpb24gaXMKPj4+PiByZXZlcnRlZCBpbiB0aGlzIHZlcnNpb24gYW5k
IHJld29yayBpbiBuZXh0IHZlcnNpb24uCj4+Pj4KPj4+PiBQbGVhc2UgcmV2aWV3Lgo+Pj4+Cj4+
Pj4gVGhhbmtzCj4+Pj4KPj4+PiBKYXNvbiBXYW5nICgyKToKPj4+PiAgICAgUmV2ZXJ0ICJ2aG9z
dDogYWNjZXNzIHZxIG1ldGFkYXRhIHRocm91Z2gga2VybmVsIHZpcnR1YWwgYWRkcmVzcyIKPj4+
PiAgICAgdmhvc3Q6IHJlLWludHJvZHVjaW5nIG1ldGFkYXRhIGFjY2VsZXJhdGlvbiB0aHJvdWdo
IGtlcm5lbCB2aXJ0dWFsCj4+Pj4gICAgICAgYWRkcmVzcwo+Pj4gVGhlcmUgYXJlIGEgYnVuY2gg
b2YgcGF0Y2hlcyBpbiB0aGUgcXVldWUgYWxyZWFkeSB0aGF0IHdpbGwgaGVscAo+Pj4gdmhvc3Qs
IGFuZCBJIGEgd29ya2luZyBvbiBvbmUgZm9yIG5leHQgY3ljbGUgdGhhdCB3aWxsIGhlbHAgYWxv
dCBtb3JlCj4+PiB0b28uCj4+Cj4+IEkgd2lsbCBjaGVjayB0aG9zZSBwYXRjaGVzLCBidXQgaWYg
eW91IGNhbiBnaXZlIG1lIHNvbWUgcG9pbnRlcnMgb3Iga2V5d29yZHMKPj4gaXQgd291bGQgYmUg
bXVjaCBhcHByZWNpYXRlZC4KPiBZb3UgY2FuIGxvb2sgaGVyZToKPgo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9qZ3VudGhvcnBlL2xpbnV4L2NvbW1pdHMvbW11X25vdGlmaWVyCj4KPiBUaGUgZmlyc3Qg
cGFydHMsIHRoZSBnZXQvcHV0IGFyZSBpbiB0aGUgaG1tIHRyZWUsIGFuZCB0aGUgbGFzdCBwYXJ0
LAo+IHRoZSBpbnRlcnZhbCB0cmVlIGluIHRoZSBsYXN0IGNvbW1pdCBpcyBzdGlsbCBhIFdJUCwg
YnV0IGl0IHdvdWxkCj4gcmVtb3ZlIGFsb3Qgb2YgdGhhdCBjb2RlIGZyb20gdmhvc3QgYXMgd2Vs
bC4KPgo+IEphc29uCgoKVGhhbmtzIGEgbG90LCB3aWxsIGhhdmUgYSBsb29rIGF0IHRoZXNlIGFu
ZCBjb21lIGJhY2sgaWYgSSBtZXQgYW55IGlzc3Vlcy4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
