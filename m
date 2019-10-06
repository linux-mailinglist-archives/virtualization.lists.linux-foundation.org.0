Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B294FCCF6F
	for <lists.virtualization@lfdr.de>; Sun,  6 Oct 2019 10:30:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 69DD4E21;
	Sun,  6 Oct 2019 08:30:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D82F2E04
	for <virtualization@lists.linux-foundation.org>;
	Sun,  6 Oct 2019 08:30:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6319D27B
	for <virtualization@lists.linux-foundation.org>;
	Sun,  6 Oct 2019 08:30:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3D343082A6C;
	Sun,  6 Oct 2019 08:30:44 +0000 (UTC)
Received: from [10.36.116.58] (ovpn-116-58.ams2.redhat.com [10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E850F608C2;
	Sun,  6 Oct 2019 08:30:40 +0000 (UTC)
Subject: Re: VIRTIO_BALLOON_F_FREE_PAGE_HINT
To: Tyler Sanderson <tysand@google.com>
References: <CAJuQAmpQmNN1EJHm4RinZnBven9Bx4GGqd-8Mt+L=3Z-3pd+zg@mail.gmail.com>
	<5D7EE856.2080602@intel.com>
	<09257686-90df-5c31-c35f-9d16fc77fee1@redhat.com>
	<CAJuQAmpQV26kb9vTyoW-Q7PsD0SOfX+otkiQZAks1L6k7rgdig@mail.gmail.com>
	<20191003142854-mutt-send-email-mst@kernel.org>
	<CAJuQAmrCiPsofYpDvm8=i32d9c9yCmKpJRBSRFkeubP_2=XKtw@mail.gmail.com>
	<0df87f00-5102-973b-3a7a-735e44f4ac3f@redhat.com>
	<20191004043446-mutt-send-email-mst@kernel.org>
	<30c6feba-7037-b52f-3ef4-4a5c50be0aff@redhat.com>
	<CAJuQAmpwQ4guGtHTTWC60EAYBuJ264d6CgWmWEHSnb8-CRtWBw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <859eada9-d3e2-8f28-ebd6-a8cb562dbff5@redhat.com>
Date: Sun, 6 Oct 2019 10:30:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJuQAmpwQ4guGtHTTWC60EAYBuJ264d6CgWmWEHSnb8-CRtWBw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Sun, 06 Oct 2019 08:30:44 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: virtualization@lists.linux-foundation.org,
	"Michael S. Tsirkin" <mst@redhat.com>
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

T24gMDQuMTAuMTkgMjE6MDMsIFR5bGVyIFNhbmRlcnNvbiB3cm90ZToKPiBJIHRoaW5rIERFRkxB
VEVfT05fT09NIG1ha2VzIHNlbnNlIGNvbmNlcHR1YWxseSwgaXQncyBqdXN0IHRoYXQgdGhlCj4g
aW1wbGVtZW50YXRpb24gZG9lc24ndCBwbGF5IHdlbGwgd2l0aCB0aGUgcmVzdCBvZiBtZW1vcnkg
bWFuYWdlbWVudAo+IHVuZGVyIG1lbW9yeSBwcmVzc3VyZS4KPiBJdCBjb3VsZCBwcm9iYWJseSBi
ZSBmaXhlZCB3aXRoIGVub3VnaCBlZmZvcnQsIGJ1dCBJTU8gZnJlZSBwYWdlIGhpbnRpbmcKPiBn
ZXRzIDkwJSBvZiB0aGUgYmVuZWZpdCB3aXRob3V0IHBva2luZyB0aGUgZGFyayBjb3JuZXJzIG9m
IG1lbW9yeQo+IG1hbmFnZW1lbnQgYW5kIHNvIGlzIGEgbmV0IHdpbi4KPiAKPiBUaGUgb2J2aW91
cyBwbGFjZSB3aGVyZSBmcmVlIHBhZ2UgaGludGluZyBmYWxscyBzaG9ydCAoYXMgRGF2aWQgcG9p
bnRlZAo+IG91dCBhYm92ZSkgaXMgdGhhdCBpdCBjYW4ndCBwcmVzc3VyZSB0aGUgcGFnZSBjYWNo
ZS4KCk9uZSBzb2x1dGlvbiBpcyB0byBtb3ZlIHRoZSBwYWdlIGNhY2hlIHRvIHRoZSBoeXBlcnZp
c29yLCBlLmcuLCB1c2luZwplbXVsYXRlZCBOVkRJTU1zIG9yIHZpcnRpby1wbWVtLgoKPiBXb3Vs
ZCBpdCBiZSBwb3NzaWJsZcKgdG8gYWRkIGEgbWVjaGFuaXNtIHRoYXQgZXhwbGljaXRseSBjYXVz
ZXMgcGFnZQo+IGNhY2hlIHRvIHNocmluayB3aXRob3V0IHJlcXVpcmluZyB0aGUgc3lzdGVtIHRv
IGJlIHVuZGVyIG1lbW9yeSBwcmVzc3VyZT8KPiAKCldlIGRvIGhhdmUgYSBzeXNjdGwgImRyb3Bf
Y2FjaGVzIiB3aGljaCBjYWxscwppdGVyYXRlX3N1cGVycyhkcm9wX3BhZ2VjYWNoZV9zYiwgTlVM
TCkgYW5kIGRyb3Bfc2xhYigpLgoKZG9jL0RvY3VtZW50YXRpb24vc3lzY3RsL3ZtLnR4dDoKPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KCmRyb3BfY2FjaGVzCgpXcml0aW5nIHRvIHRoaXMgd2lsbCBjYXVzZSB0aGUga2VybmVsIHRv
IGRyb3AgY2xlYW4gY2FjaGVzLCBhcyB3ZWxsIGFzCnJlY2xhaW1hYmxlIHNsYWIgb2JqZWN0cyBs
aWtlIGRlbnRyaWVzIGFuZCBpbm9kZXMuICBPbmNlIGRyb3BwZWQsIHRoZWlyCm1lbW9yeSBiZWNv
bWVzIGZyZWUuCgpUbyBmcmVlIHBhZ2VjYWNoZToKCWVjaG8gMSA+IC9wcm9jL3N5cy92bS9kcm9w
X2NhY2hlcwpUbyBmcmVlIHJlY2xhaW1hYmxlIHNsYWIgb2JqZWN0cyAoaW5jbHVkZXMgZGVudHJp
ZXMgYW5kIGlub2Rlcyk6CgllY2hvIDIgPiAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMKVG8gZnJl
ZSBzbGFiIG9iamVjdHMgYW5kIHBhZ2VjYWNoZToKCWVjaG8gMyA+IC9wcm9jL3N5cy92bS9kcm9w
X2NhY2hlcwoKVGhpcyBpcyBhIG5vbi1kZXN0cnVjdGl2ZSBvcGVyYXRpb24gYW5kIHdpbGwgbm90
IGZyZWUgYW55IGRpcnR5IG9iamVjdHMuClRvIGluY3JlYXNlIHRoZSBudW1iZXIgb2Ygb2JqZWN0
cyBmcmVlZCBieSB0aGlzIG9wZXJhdGlvbiwgdGhlIHVzZXIgbWF5IHJ1bgpgc3luYycgcHJpb3Ig
dG8gd3JpdGluZyB0byAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMuICBUaGlzIHdpbGwgbWluaW1p
emUgdGhlCm51bWJlciBvZiBkaXJ0eSBvYmplY3RzIG9uIHRoZSBzeXN0ZW0gYW5kIGNyZWF0ZSBt
b3JlIGNhbmRpZGF0ZXMgdG8gYmUKZHJvcHBlZC4KClRoaXMgZmlsZSBpcyBub3QgYSBtZWFucyB0
byBjb250cm9sIHRoZSBncm93dGggb2YgdGhlIHZhcmlvdXMga2VybmVsIGNhY2hlcwooaW5vZGVz
LCBkZW50cmllcywgcGFnZWNhY2hlLCBldGMuLi4pICBUaGVzZSBvYmplY3RzIGFyZSBhdXRvbWF0
aWNhbGx5CnJlY2xhaW1lZCBieSB0aGUga2VybmVsIHdoZW4gbWVtb3J5IGlzIG5lZWRlZCBlbHNl
d2hlcmUgb24gdGhlIHN5c3RlbS4KClVzZSBvZiB0aGlzIGZpbGUgY2FuIGNhdXNlIHBlcmZvcm1h
bmNlIHByb2JsZW1zLiAgU2luY2UgaXQgZGlzY2FyZHMgY2FjaGVkCm9iamVjdHMsIGl0IG1heSBj
b3N0IGEgc2lnbmlmaWNhbnQgYW1vdW50IG9mIEkvTyBhbmQgQ1BVIHRvIHJlY3JlYXRlIHRoZQpk
cm9wcGVkIG9iamVjdHMsIGVzcGVjaWFsbHkgaWYgdGhleSB3ZXJlIHVuZGVyIGhlYXZ5IHVzZS4g
IEJlY2F1c2Ugb2YgdGhpcywKdXNlIG91dHNpZGUgb2YgYSB0ZXN0aW5nIG9yIGRlYnVnZ2luZyBl
bnZpcm9ubWVudCBpcyBub3QgcmVjb21tZW5kZWQuCgpZb3UgbWF5IHNlZSBpbmZvcm1hdGlvbmFs
IG1lc3NhZ2VzIGluIHlvdXIga2VybmVsIGxvZyB3aGVuIHRoaXMgZmlsZSBpcwp1c2VkOgoKCWNh
dCAoMTIzNCk6IGRyb3BfY2FjaGVzOiAzCgpUaGVzZSBhcmUgaW5mb3JtYXRpb25hbCBvbmx5LiAg
VGhleSBkbyBub3QgbWVhbiB0aGF0IGFueXRoaW5nIGlzIHdyb25nCndpdGggeW91ciBzeXN0ZW0u
ICBUbyBkaXNhYmxlIHRoZW0sIGVjaG8gNCAoYml0IDIpIGludG8gZHJvcF9jYWNoZXMuCgo9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQoKUGxlYXNlIG5vdGUgdGhlICJ1c2Ugb3V0c2lkZSBvZiBhIHRlc3Rpbmcgb3IgZGVidWdnaW5n
IGVudmlyb25tZW50IGlzCm5vdCByZWNvbW1lbmRlZCIuIFVzdWFsbHkgeW91IHdhbnQgYSAic29m
dCIgdmVyc2lvbiBvZiB0aGlzLCBlLmcuLCB2aWEKdGhlIE9PTSBoYW5kbGVyIChzbyBvbmx5IGRy
b3AgcGFydHMgb2YgdGhlIGNhY2hlLCBub3QgYWxsKS4KCi0tIAoKVGhhbmtzLAoKRGF2aWQgLyBk
aGlsZGVuYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
