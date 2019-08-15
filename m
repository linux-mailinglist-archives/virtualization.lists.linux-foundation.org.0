Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A03228E325
	for <lists.virtualization@lfdr.de>; Thu, 15 Aug 2019 05:27:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B4E33C91;
	Thu, 15 Aug 2019 03:26:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9B8BAC5C
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 03:26:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 576DBCF
	for <virtualization@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 03:26:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6A76300894D;
	Thu, 15 Aug 2019 03:26:54 +0000 (UTC)
Received: from [10.72.12.184] (ovpn-12-184.pek2.redhat.com [10.72.12.184])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF74A27C2C;
	Thu, 15 Aug 2019 03:26:49 +0000 (UTC)
Subject: Re: [PATCH V5 0/9] Fixes for vhost metadata acceleration
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20190809054851.20118-1-jasowang@redhat.com>
	<20190810134948-mutt-send-email-mst@kernel.org>
	<360a3b91-1ac5-84c0-d34b-a4243fa748c4@redhat.com>
	<20190812054429-mutt-send-email-mst@kernel.org>
	<20190812130252.GE24457@ziepe.ca>
	<9a9641fe-b48f-f32a-eecc-af9c2f4fbe0e@redhat.com>
	<20190813115707.GC29508@ziepe.ca>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <74838e61-3a5e-0f51-2092-f4a16d144b45@redhat.com>
Date: Thu, 15 Aug 2019 11:26:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813115707.GC29508@ziepe.ca>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 15 Aug 2019 03:26:54 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvOC8xMyDkuIvljYg3OjU3LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gVHVl
LCBBdWcgMTMsIDIwMTkgYXQgMDQ6MzE6MDdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPgo+
PiBXaGF0IGtpbmQgb2YgaXNzdWVzIGRvIHlvdSBzZWU/IFNwaW5sb2NrIGlzIHRvIHN5bmNocm9u
aXplIEdVUCB3aXRoIE1NVQo+PiBub3RpZmllciBpbiB0aGlzIHNlcmllcy4KPiBBIEdVUCB0aGF0
IGNhbid0IHNsZWVwIGNhbid0IHBhZ2VmYXVsdCB3aGljaCBtYWtlcyBpdCBhIHJlYWxseSB3ZWly
ZAo+IHBhdHRlcm4KCgpNeSB1bmRlcnN0YW5kaW5nIGlzIF9fZ2V0X3VzZXJfcGFnZXNfZmFzdCgp
IGFzc3VtZXMgY2FsbGVyIGNhbiBmYWlsIG9yIApoYXZlIGZhbGxiYWNrLiBBbmQgd2UgaGF2ZSBn
cmFjZWZ1bCBmYWxsYmFjayB0byBjb3B5X3t0b3xmcm9tfV91c2VyKCkuCgoKPgo+PiBCdHcsIGJh
Y2sgdG8gdGhlIG9yaWdpbmFsIHF1ZXN0aW9uLiBNYXkgSSBrbm93IHdoeSBzeW5jaHJvbml6ZV9y
Y3UoKSBpcyBub3QKPj4gc3VpdGFibGU/IENvbnNpZGVyOgo+IFdlIGFscmVhZHkgd2VudCBvdmVy
IHRoaXMuIFlvdSdkIG5lZWQgdG8gZGV0ZXJtaW5lIGl0IGRvZXNuJ3Qgc29tZWhvdwo+IGRlYWRs
b2NrIHRoZSBtbSBvbiByZWNsYWltIHBhdGhzLiBNYXliZSBpdCBpcyBPSywgdGhlIHJjcV9ncV93
cSBpcwo+IG1hcmtlZCBXUV9NRU1fUkVDTEFJTSBhdCBsZWFzdC4uCgoKWWVzLCB3aWxsIHRha2Ug
YSBsb29rIGF0IHRoaXMuCgoKPgo+IEkgYWxzbyB0aGluayBNaWNoYWVsIHdhcyBjb25jZXJuZWQg
YWJvdXQgdGhlIGxhdGVuY3kgc3Bpa2VzIGEgbG9uZyBSQ1UKPiBkZWxheSB3b3VsZCBjYXVzZS4K
CgpJIGRvbid0IHRoaW5rIGl0J3MgYSByZWFsIHByb2JsZW0gY29uc2lkZXIgTU1VIG5vdGlmaWVy
IGNvdWxkIGJlIApwcmVlbXB0ZWQgb3IgYmxvY2tlZC4KClRoYW5rcwoKCj4KPiBKYXNvbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
