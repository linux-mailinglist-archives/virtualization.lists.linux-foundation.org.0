Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E5A810D9
	for <lists.virtualization@lfdr.de>; Mon,  5 Aug 2019 06:21:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ADD23C75;
	Mon,  5 Aug 2019 04:20:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 466A3AF7
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 04:20:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E2E915E4
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 04:20:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E8B5A3EB3;
	Mon,  5 Aug 2019 04:20:53 +0000 (UTC)
Received: from [10.72.12.115] (ovpn-12-115.pek2.redhat.com [10.72.12.115])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 870955D9E2;
	Mon,  5 Aug 2019 04:20:47 +0000 (UTC)
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <11b2a930-eae4-522c-4132-3f8a2da05666@redhat.com>
Date: Mon, 5 Aug 2019 12:20:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802124613.GA11245@ziepe.ca>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 05 Aug 2019 04:20:53 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvOC8yIOS4i+WNiDg6NDYsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBGcmks
IEF1ZyAwMiwgMjAxOSBhdCAwNTo0MDowN1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4g
VGhpcyBtdXN0IGJlIGEgcHJvcGVyIGJhcnJpZXIsIGxpa2UgYSBzcGlubG9jaywgbXV0ZXgsIG9y
Cj4+PiBzeW5jaHJvbml6ZV9yY3UuCj4+Cj4+IEkgc3RhcnQgd2l0aCBzeW5jaHJvbml6ZV9yY3Uo
KSBidXQgYm90aCB5b3UgYW5kIE1pY2hhZWwgcmFpc2Ugc29tZQo+PiBjb25jZXJuLgo+IEkndmUg
YWxzbyBpZGx5IHdvbmRlcmVkIGlmIGNhbGxpbmcgc3luY2hyb25pemVfcmN1KCkgdW5kZXIgdGhl
IHZhcmlvdXMKPiBtbSBsb2NrcyBpcyBhIGRlYWRsb2NrIHNpdHVhdGlvbi4KCgpNYXliZSwgdGhh
dCdzIHdoeSBJIHN1Z2dlc3QgdG8gdXNlIHZob3N0X3dvcmtfZmx1c2goKSB3aGljaCBpcyBtdWNo
IApsaWdodHdlaWdodCBjYW4gY2FuIGFjaGlldmUgdGhlIHNhbWUgZnVuY3Rpb24uIEl0IGNhbiBn
dWFyYW50ZWUgYWxsIApwcmV2aW91cyB3b3JrIGhhcyBiZWVuIHByb2Nlc3NlZCBhZnRlciB2aG9z
dF93b3JrX2ZsdXNoKCkgcmV0dXJuLgoKCj4KPj4gVGhlbiBJIHRyeSBzcGlubG9jayBhbmQgbXV0
ZXg6Cj4+Cj4+IDEpIHNwaW5sb2NrOiBhZGQgbG90cyBvZiBvdmVyaGVhZCBvbiBkYXRhcGF0aCwg
dGhpcyBsZWFkcyAwIHBlcmZvcm1hbmNlCj4+IGltcHJvdmVtZW50Lgo+IEkgdGhpbmsgdGhlIHRv
cGljIGhlcmUgaXMgY29ycmVjdG5lc3Mgbm90IHBlcmZvcm1hbmNlIGltcHJvdmVtZW50CgoKQnV0
IHRoZSB3aG9sZSBzZXJpZXMgaXMgdG8gc3BlZWQgdXAgdmhvc3QuCgoKPgo+PiAyKSBTUkNVOiBm
dWxsIG1lbW9yeSBiYXJyaWVyIHJlcXVpcmVzIG9uIHNyY3VfcmVhZF9sb2NrKCksIHdoaWNoIHN0
aWxsIGxlYWRzCj4+IGxpdHRsZSBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudAo+ICAgCj4+IDMpIG11
dGV4OiBhIHBvc3NpYmxlIGlzc3VlIGlzIG5lZWQgdG8gd2FpdCBmb3IgdGhlIHBhZ2UgdG8gYmUg
c3dhcHBlZCBpbiAoaXMKPj4gdGhpcyB1bmFjY2VwdGFibGUgPyksIGFub3RoZXIgaXNzdWUgaXMg
dGhhdCB3ZSBuZWVkIGhvbGQgdnEgbG9jayBkdXJpbmcKPj4gcmFuZ2Ugb3ZlcmxhcCBjaGVjay4K
PiBJIGhhdmUgYSBmZWVsaW5nIHRoYXQgbW11IG5vdGlmaWZlcnMgY2Fubm90IHNhZmVseSBiZWNv
bWUgZGVwZW5kZW50IG9uCj4gcHJvZ3Jlc3Mgb2Ygc3dhcCB3aXRob3V0IGNhdXNpbmcgZGVhZGxv
Y2suIFlvdSBwcm9iYWJseSBzaG91bGQgYXZvaWQKPiB0aGlzLgoKClllcywgc28gdGhhdCdzIHdo
eSBJIHRyeSB0byBzeW5jaHJvbml6ZSB0aGUgY3JpdGljYWwgcmVnaW9uIGJ5IG15c2VsZi4KCgo+
Pj4gQW5kLCBhZ2FpbiwgeW91IGNhbid0IHJlLWludmVudCBhIHNwaW5sb2NrIHdpdGggb3BlbiBj
b2RpbmcgYW5kIGdldAo+Pj4gc29tZXRoaW5nIGJldHRlci4KPj4gU28gdGhlIHF1ZXN0aW9uIGlz
IGlmIHdhaXRpbmcgZm9yIHN3YXAgaXMgY29uc2lkZXJlZCB0byBiZSB1bnN1aXRhYmxlIGZvcgo+
PiBNTVUgbm90aWZpZXJzLiBJZiBub3QsIGl0IHdvdWxkIHNpbXBsaWZ5IGNvZGVzLiBJZiBub3Qs
IHdlIHN0aWxsIG5lZWQgdG8KPj4gZmlndXJlIG91dCBhIHBvc3NpYmxlIHNvbHV0aW9uLgo+Pgo+
PiBCdHcsIEkgY29tZSB1cCBhbm90aGVyIGlkZWEsIHRoYXQgaXMgdG8gZGlzYWJsZSBwcmVlbXB0
aW9uIHdoZW4gdmhvc3QgdGhyZWFkCj4+IG5lZWQgdG8gYWNjZXNzIHRoZSBtZW1vcnkuIFRoZW4g
cmVnaXN0ZXIgcHJlZW1wdCBub3RpZmllciBhbmQgaWYgdmhvc3QKPj4gdGhyZWFkIGlzIHByZWVt
cHRlZCwgd2UncmUgc3VyZSBubyBvbmUgd2lsbCBhY2Nlc3MgdGhlIG1lbW9yeSBhbmQgY2FuIGRv
IHRoZQo+PiBjbGVhbnVwLgo+IEkgdGhpbmsgeW91IHNob3VsZCB1c2UgdGhlIHNwaW5sb2NrIHNv
IGF0IGxlYXN0IHRoZSBjb2RlIGlzIG9idmlvdXNseQo+IGZ1bmN0aW9uYWxseSBjb3JyZWN0IGFu
ZCB3b3JyeSBhYm91dCBkZXNpZ25pbmcgc29tZSBwcm9wZXJseSBqdXN0aWZpZWQKPiBwZXJmb3Jt
YW5jZSBjaGFuZ2UgYWZ0ZXIuCj4KPiBKYXNvbgoKClNwaW5sb2NrIGlzIGNvcnJlY3QgYnV0IG1h
a2UgdGhlIHdob2xlIHNlcmllcyBtZWFuaW5nbGVzcyBjb25zaWRlciBpdCAKd29uJ3QgYnJpbmcg
YW55IHBlcmZvcm1hbmNlIGltcHJvdmVtZW50LgoKVGhhbmtzCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
