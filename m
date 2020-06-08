Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9BF1F15C2
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 11:44:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 29C5785C9A;
	Mon,  8 Jun 2020 09:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id he9fE1fSB4De; Mon,  8 Jun 2020 09:44:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DA8DC85CCF;
	Mon,  8 Jun 2020 09:44:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8294C016F;
	Mon,  8 Jun 2020 09:44:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2BBBBC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 276AD87EA8
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EzHTiaspK1NQ
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:44:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 31BE087EA6
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591609466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/UosqSxCh5JuCf83w6SVNyttSVeqWDozCD9jkpIiB4s=;
 b=gObeA9cglhTpDH6/WveSjlVOvmmHxMQYWWXl+eYi/B7WX7W3FU+7eUIB/tjmc/6GUtnTGc
 +5uRRmRq5/D74JnlM1l9bhj0IHx6VY3RC9MdPWXHm8ufKbJtt6ak0jEaVj89AoYBg332no
 vNpCEwGSWAWDw0tfLsVNc/AcDcdZtns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-C0fOS73UNGSerR78MqhKCw-1; Mon, 08 Jun 2020 05:44:21 -0400
X-MC-Unique: C0fOS73UNGSerR78MqhKCw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D37A107ACF3;
 Mon,  8 Jun 2020 09:44:19 +0000 (UTC)
Received: from [10.72.13.71] (ovpn-13-71.pek2.redhat.com [10.72.13.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 456F21084436;
 Mon,  8 Jun 2020 09:44:02 +0000 (UTC)
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-6-jasowang@redhat.com>
 <20200602010332-mutt-send-email-mst@kernel.org>
 <5dbb0386-beeb-5bf4-d12e-fb5427486bb8@redhat.com>
 <6b1d1ef3-d65e-08c2-5b65-32969bb5ecbc@redhat.com>
 <20200607095012-mutt-send-email-mst@kernel.org>
 <9b1abd2b-232c-aa0f-d8bb-03e65fd47de2@redhat.com>
 <20200608021438-mutt-send-email-mst@kernel.org>
 <a1b1b7fb-b097-17b7-2e3a-0da07d2e48ae@redhat.com>
 <20200608052041-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9d2571b6-0b95-53b3-6989-b4d801eeb623@redhat.com>
Date: Mon, 8 Jun 2020 17:43:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608052041-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: shahafs@mellanox.com, lulu@redhat.com, kvm@vger.kernel.org,
 saugatm@xilinx.com, netdev@vger.kernel.org, mhabets@solarflare.com,
 vmireyno@marvell.com, linux-kernel@vger.kernel.org, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, zhangweining@ruijie.com.cn, eli@mellanox.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNi84IOS4i+WNiDU6MzEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBN
b24sIEp1biAwOCwgMjAyMCBhdCAwNToxODo0NFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzYvOCDkuIvljYgyOjMyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBP
biBNb24sIEp1biAwOCwgMjAyMCBhdCAxMTozMjozMUFNICswODAwLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+Pj4+IE9uIDIwMjAvNi83IOS4i+WNiDk6NTEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToK
Pj4+Pj4gT24gRnJpLCBKdW4gMDUsIDIwMjAgYXQgMDQ6NTQ6MTdQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPj4+Pj4+IE9uIDIwMjAvNi8yIOS4i+WNiDM6MDgsIEphc29uIFdhbmcgd3JvdGU6
Cj4+Pj4+Pj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHZwX3ZkcGFfaWRf
dGFibGVbXSA9IHsKPj4+Pj4+Pj4+ICvCoMKgwqAgeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURf
UkVESEFUX1FVTVJBTkVULCBQQ0lfQU5ZX0lEKSB9LAo+Pj4+Pj4+Pj4gK8KgwqDCoCB7IDAgfQo+
Pj4+Pj4+Pj4gK307Cj4+Pj4+Pj4+IFRoaXMgbG9va3MgbGlrZSBpdCdsbCBjcmVhdGUgYSBtZXNz
IHdpdGggZWl0aGVyIHZpcnRpbyBwY2kKPj4+Pj4+Pj4gb3IgdmRwYSBiZWluZyBsb2FkZWQgYXQg
cmFuZG9tLiBNYXliZSBqdXN0IGRvbid0IHNwZWNpZnkKPj4+Pj4+Pj4gYW55IElEcyBmb3Igbm93
LiBEb3duIHRoZSByb2FkIHdlIGNvdWxkIGdldCBhCj4+Pj4+Pj4+IGRpc3RpbmN0IHZlbmRvciBJ
RCBvciBhIHJhbmdlIG9mIGRldmljZSBJRHMgZm9yIHRoaXMuCj4+Pj4+Pj4gUmlnaHQsIHdpbGwg
ZG8uCj4+Pj4+Pj4KPj4+Pj4+PiBUaGFua3MKPj4+Pj4+IFJldGhpbmsgYWJvdXQgdGhpcy4gSWYg
d2UgZG9uJ3Qgc3BlY2lmeSBhbnkgSUQsIHRoZSBiaW5kaW5nIHdvbid0IHdvcmsuCj4+Pj4+IFdl
IGNhbiBiaW5kIG1hbnVhbGx5LiBJdCdzIG5vdCByZWFsbHkgZm9yIHByb2R1Y3Rpb24gYW55d2F5
LCBzbwo+Pj4+PiBub3QgYSBiaWcgZGVhbCBpbWhvLgo+Pj4+IEkgdGhpbmsgeW91IG1lYW4gZG9p
bmcgaXQgdmlhICJuZXdfaWQiLCByaWdodC4KPj4+IEkgcmVhbGx5IG1lYW50IGRyaXZlcl9vdmVy
cmlkZS4gVGhpcyBpcyB3aGF0IHBlb3BsZSBoYXZlIGJlZW4gdXNpbmcKPj4+IHdpdGggcGNpLXN0
dWIgZm9yIHllYXJzIG5vdy4KPj4KPj4gRG8geW91IHdhbnQgbWUgdG8gaW1wbGVtZW50ICJkcml2
ZXJfb3ZlcnJpZCIgaW4gdGhpcyBzZXJpZXMsIG9yIGEgTlVMTAo+PiBpZF90YWJsZSBpcyBzdWZm
aWNpZW50Pwo+Cj4gRG9lc24ndCB0aGUgcGNpIHN1YnN5c3RlbSBjcmVhdGUgZHJpdmVyX292ZXJy
aWRlIGZvciBhbGwgZGV2aWNlcwo+IG9uIHRoZSBwY2kgYnVzPwoKClllcywgSSBtaXNzIHRoaXMu
CgoKPj4+Pj4+IEhvdyBhYm91dCB1c2luZyBhIGRlZGljYXRlZCBzdWJzeXN0ZW0gdmVuZG9yIGlk
IGZvciB0aGlzPwo+Pj4+Pj4KPj4+Pj4+IFRoYW5rcwo+Pj4+PiBJZiB2aXJ0aW8gdmVuZG9yIGlk
IGlzIHVzZWQgdGhlbiBzdGFuZGFyZCBkcml2ZXIgaXMgZXhwZWN0ZWQKPj4+Pj4gdG8gYmluZCwg
cmlnaHQ/IE1heWJlIHVzZSBhIGRlZGljYXRlZCB2ZW5kb3IgaWQ/Cj4+Pj4gSSBtZWFudCBzb21l
dGhpbmcgbGlrZToKPj4+Pgo+Pj4+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCB2
cF92ZHBhX2lkX3RhYmxlW10gPSB7Cj4+Pj4gICDCoMKgwqAgeyBQQ0lfREVWSUNFX1NVQihQQ0lf
VkVORE9SX0lEX1JFREhBVF9RVU1SQU5FVCwgUENJX0FOWV9JRCwKPj4+PiBWUF9URVNUX1ZFTkRP
Ul9JRCwgVlBfVEVTVF9ERVZJQ0VfSUQpIH0sCj4+Pj4gICDCoMKgwqAgeyAwIH0KPj4+PiB9Owo+
Pj4+Cj4+Pj4gVGhhbmtzCj4+Pj4KPj4+IFRoZW4gcmVndWxhciB2aXJ0aW8gd2lsbCBzdGlsbCBi
aW5kIHRvIGl0LiBJdCBoYXMKPj4+Cj4+PiBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX2NvbW1v
bi5jOiAgICAgeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfUkVESEFUX1FVTVJBTkVULCBQQ0lf
QU5ZX0lEKSB9LAo+Pj4KPj4+Cj4+IElGQ1ZGIHVzZSB0aGlzIHRvIGF2b2lkIHRoZSBiaW5kaW5n
IHRvIHJlZ3VsYXIgdmlydGlvIGRldmljZS4KPgo+IE93LiBJbmRlZWQ6Cj4KPiAjZGVmaW5lIElG
Q1ZGX1ZFTkRPUl9JRCAgICAgICAgIDB4MUFGNAo+Cj4gV2hpY2ggaXMgb2YgY291cnNlIG5vdCBh
biBJRkNWRiB2ZW5kb3IgaWQsIGl0J3MgdGhlIFJlZCBIYXQgdmVuZG9yIElELgo+Cj4gSSBtaXNz
ZWQgdGhhdC4KPgo+IERvZXMgaXQgYWN0dWFsbHkgd29yayBpZiB5b3UgYmluZCBhIHZpcnRpbyBk
cml2ZXIgdG8gaXQ/CgoKSXQgd29ya3MuCgoKPiBJJ20gZ3Vlc3Npbmcgbm8gb3RoZXJ3aXNlIHRo
ZXkgd291bGRuJ3QgbmVlZCBJRkMgZHJpdmVyLCByaWdodD8KPgoKTG9va2luZyBhdCB0aGUgZHJp
dmVyLCB0aGV5IHVzZWQgYSBkZWRpY2F0ZWQgYmFyIGZvciBkZWFsaW5nIHdpdGggCnZpcnRxdWV1
ZSBzdGF0ZSBzYXZlL3Jlc3RvcmUuIEl0CgoKPgo+Cj4+IExvb2tpbmcgYXQKPj4gcGNpX21hdGNo
X29uZV9kZXZpY2UoKSBpdCBjaGVja3MgYm90aCBzdWJ2ZW5kb3IgYW5kIHN1YmRldmljZSB0aGVy
ZS4KPj4KPj4gVGhhbmtzCj4KPiBCdXQgSUlVQyB0aGVyZSBpcyBubyBndWFyYW50ZWUgdGhhdCBk
cml2ZXIgd2l0aCBhIHNwZWNpZmljIHN1YnZlbmRvcgo+IG1hdGNoZXMgaW4gcHJlc2VuY2Ugb2Yg
YSBnZW5lcmljIG9uZS4KPiBTbyBlaXRoZXIgSUZDIG9yIHZpcnRpbyBwY2kgY2FuIHdpbiwgd2hp
Y2hldmVyIGJpbmRzIGZpcnN0LgoKCkknbSBub3Qgc3VyZSBJIGdldCB0aGVyZS4gQnV0IEkgdHJ5
IG1hbnVhbGx5IGJpbmQgSUZDVkYgdG8gcWVtdSdzIAp2aXJ0aW8tbmV0LXBjaSwgYW5kIGl0IGZh
aWxzLgoKVGhhbmtzCgoKPgo+IEkgZ3Vlc3Mgd2UgbmVlZCB0byBibGFja2xpc3QgSUZDIGluIHZp
cnRpbyBwY2kgcHJvYmUgY29kZS4gVWdoLgoKCgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
