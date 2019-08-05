Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CBA8110D
	for <lists.virtualization@lfdr.de>; Mon,  5 Aug 2019 06:34:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 51CDDC75;
	Mon,  5 Aug 2019 04:33:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 895CFB09
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 04:33:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1FD505E4
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 04:33:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E5ED793C9;
	Mon,  5 Aug 2019 04:33:51 +0000 (UTC)
Received: from [10.72.12.115] (ovpn-12-115.pek2.redhat.com [10.72.12.115])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D987960127;
	Mon,  5 Aug 2019 04:33:46 +0000 (UTC)
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802094331-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6c3a0a1c-ce87-907b-7bc8-ec41bf9056d8@redhat.com>
Date: Mon, 5 Aug 2019 12:33:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802094331-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 05 Aug 2019 04:33:51 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvOC8yIOS4i+WNiDEwOjAzLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
RnJpLCBBdWcgMDIsIDIwMTkgYXQgMDU6NDA6MDdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gQnR3LCBJIGNvbWUgdXAgYW5vdGhlciBpZGVhLCB0aGF0IGlzIHRvIGRpc2FibGUgcHJlZW1w
dGlvbiB3aGVuIHZob3N0IHRocmVhZAo+PiBuZWVkIHRvIGFjY2VzcyB0aGUgbWVtb3J5LiBUaGVu
IHJlZ2lzdGVyIHByZWVtcHQgbm90aWZpZXIgYW5kIGlmIHZob3N0Cj4+IHRocmVhZCBpcyBwcmVl
bXB0ZWQsIHdlJ3JlIHN1cmUgbm8gb25lIHdpbGwgYWNjZXNzIHRoZSBtZW1vcnkgYW5kIGNhbiBk
byB0aGUKPj4gY2xlYW51cC4KPiBHcmVhdCwgbW9yZSBub3RpZmllcnMgOigKPgo+IE1heWJlIGNh
biBsaXZlIHdpdGgKPiAxLSBkaXNhYmxlIHByZWVtcHRpb24gd2hpbGUgdXNpbmcgdGhlIGNhY2hl
ZCBwb2ludGVyCj4gMi0gdGVhY2ggdmhvc3QgdG8gcmVjb3ZlciBmcm9tIG1lbW9yeSBhY2Nlc3Mg
ZmFpbHVyZXMsCj4gICAgIGJ5IHN3aXRjaGluZyB0byByZWd1bGFyIGZyb20vdG8gdXNlciBwYXRo
CgoKSSBkb24ndCBnZXQgdGhpcywgSSBiZWxpZXZlIHdlIHdhbnQgdG8gcmVjb3ZlciBmcm9tIHJl
Z3VsYXIgZnJvbS90byB1c2VyIApwYXRoLCBpc24ndCBpdD8KCgo+Cj4gU28gaWYgeW91IHdhbnQg
dG8gdHJ5IHRoYXQsIGZpbmUgc2luY2UgaXQncyBhIHN0ZXAgaW4KPiB0aGUgcmlnaHQgZGlyZWN0
aW9uLgo+Cj4gQnV0IEkgdGhpbmsgZnVuZGFtZW50YWxseSBpdCdzIG5vdCB3aGF0IHdlIHdhbnQg
dG8gZG8gbG9uZyB0ZXJtLgoKClllcy4KCgo+Cj4gSXQncyBhbHdheXMgYmVlbiBhIGZ1bmRhbWVu
dGFsIHByb2JsZW0gd2l0aCB0aGlzIHBhdGNoIHNlcmllcyB0aGF0IG9ubHkKPiBtZXRhZGF0YSBp
cyBhY2Nlc3NlZCB0aHJvdWdoIGEgZGlyZWN0IHBvaW50ZXIuCj4KPiBUaGUgZGlmZmVyZW5jZSBp
biB3YXlzIHlvdSBoYW5kbGUgbWV0YWRhdGEgYW5kIGRhdGEgaXMgd2hhdCBpcwo+IG5vdyBjb21p
bmcgYW5kIG1lc3NpbmcgZXZlcnl0aGluZyB1cC4KCgpJIGRvIHByb3Bvc2Ugc29lbXRoaW5nIGxp
a2UgdGhpcyBpbiB0aGUgcGFzdDogCmh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4
LXZpcnR1YWxpemF0aW9uL21zZzM2ODI0Lmh0bWwuIEJ1dCAKbG9va3MgbGlrZSB5b3UgaGF2ZSBz
b21lIGNvbmNlcm4gYWJvdXQgaXRzIGxvY2FsaXR5LgoKQnV0IHRoZSBwcm9ibGVtIHN0aWxsIHRo
ZXJlLCBHVVAgY2FuIGRvIHBhZ2UgZmF1bHQsIHNvIHN0aWxsIG5lZWQgdG8gCnN5bmNocm9uaXpl
IGl0IHdpdGggTU1VIG5vdGlmaWVycy4gVGhlIHNvbHV0aW9uIG1pZ2h0IGJlIHNvbWV0aGluZyBs
aWtlIAptb3ZpbmcgR1VQIHRvIGEgZGVkaWNhdGVkIGtpbmQgb2Ygdmhvc3Qgd29yay4KCgo+Cj4g
U28gaWYgY29udGludWluZyB0aGUgZGlyZWN0IG1hcCBhcHByb2FjaCwKPiB3aGF0IGlzIG5lZWRl
ZCBpcyBhIGNhY2hlIG9mIG1hcHBlZCBWTSBtZW1vcnksIHRoZW4gb24gYSBjYWNoZSBtaXNzCj4g
d2UnZCBxdWV1ZSB3b3JrIGFsb25nIHRoZSBsaW5lcyBvZiAxLTIgYWJvdmUuCj4KPiBUaGF0J3Mg
b25lIGRpcmVjdGlvbiB0byB0YWtlLiBBbm90aGVyIG9uZSBpcyB0byBnaXZlIHVwIG9uIHRoYXQg
YW5kCj4gd3JpdGUgb3VyIG93biB2ZXJzaW9uIG9mIHVhY2Nlc3MgbWFjcm9zLiAgQWRkIGEgImhp
Z2ggc2VjdXJpdHkiIGZsYWcgdG8KPiB0aGUgdmhvc3QgbW9kdWxlIGFuZCBpZiBub3QgYWN0aXZl
IHVzZSB0aGVzZSBmb3IgdXNlcnNwYWNlIG1lbW9yeQo+IGFjY2Vzcy4KCgpPciB1c2luZyBTRVRf
QkFDS0VORF9GRUFUVVJFUz8gQnV0IGRvIHlvdSBtZWFuIHBlcm1hbmVudCBHVVAgYXMgSSBkaWQg
aW4gCm9yaWdpbmFsIFJGQyBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOC8xMi8xMy8yMTg/CgpU
aGFua3MKCj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=
