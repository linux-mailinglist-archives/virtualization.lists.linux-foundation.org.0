Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E9035C10A
	for <lists.virtualization@lfdr.de>; Mon, 12 Apr 2021 11:23:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26C026003C;
	Mon, 12 Apr 2021 09:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RXwXN8z6d0gF; Mon, 12 Apr 2021 09:23:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id D579E60901;
	Mon, 12 Apr 2021 09:23:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 469C0C000A;
	Mon, 12 Apr 2021 09:23:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47D48C000A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 09:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F231608F0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 09:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9HcK5B8kaiwt
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 09:23:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43E59605BE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 09:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618219419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VYKRsudbOeg9+JxQeSQgy3b7HIceE1y/TyGuk/iOs+Q=;
 b=gzjal0XzG0mRKGsl7htqwcC+mssU3VZYO+sdRpO349TTTx9xMJZHGfkoJYWXPpZDijcaYQ
 PP6FlnOrub0C7a58s8szSZio1udtmkNB8vYabPuE8YcxVcp+uycmcYeKmI4TrN7G1CTiyu
 PS1pib53tYKP4c95aRqhles1c+ebsb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-hSTfSQBcPpSP-TNFeYwo6g-1; Mon, 12 Apr 2021 05:23:37 -0400
X-MC-Unique: hSTfSQBcPpSP-TNFeYwo6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 451066D585;
 Mon, 12 Apr 2021 09:23:36 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-232.pek2.redhat.com
 [10.72.13.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F365419C45;
 Mon, 12 Apr 2021 09:23:28 +0000 (UTC)
Subject: Re: [RFC PATCH] vdpa: mandate 1.0 device
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210408082648.20145-1-jasowang@redhat.com>
 <20210408115834-mutt-send-email-mst@kernel.org>
 <a6a4ab68-c958-7266-c67c-142960222b67@redhat.com>
 <20210409115343-mutt-send-email-mst@kernel.org>
 <42891807-cb24-5352-f8cb-798e9d1a1854@redhat.com>
 <20210412050730-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <01918e14-7f7a-abf2-5864-292a32f0233c@redhat.com>
Date: Mon, 12 Apr 2021 17:23:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210412050730-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: elic@nvidia.com, linux-kernel@vger.kernel.org, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>, virtualization@lists.linux-foundation.org
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

CuWcqCAyMDIxLzQvMTIg5LiL5Y2INTowOSwgTWljaGFlbCBTLiBUc2lya2luIOWGmemBkzoKPiBP
biBNb24sIEFwciAxMiwgMjAyMSBhdCAwMjozNTowN1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+PiDlnKggMjAyMS80LzEwIOS4iuWNiDEyOjA0LCBNaWNoYWVsIFMuIFRzaXJraW4g5YaZ6YGT
Ogo+Pj4gT24gRnJpLCBBcHIgMDksIDIwMjEgYXQgMTI6NDc6NTVQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPj4+PiDlnKggMjAyMS80Lzgg5LiL5Y2IMTE6NTksIE1pY2hhZWwgUy4gVHNpcmtp
biDlhpnpgZM6Cj4+Pj4+IE9uIFRodSwgQXByIDA4LCAyMDIxIGF0IDA0OjI2OjQ4UE0gKzA4MDAs
IEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4+PiBUaGlzIHBhdGNoIG1hbmRhdGVzIDEuMCBmb3IgdkRQ
QSBkZXZpY2VzLiBUaGUgZ29hbCBpcyB0byBoYXZlIHRoZQo+Pj4+Pj4gc2VtYW50aWMgb2Ygbm9y
bWF0aXZlIHN0YXRlbWVudCBpbiB0aGUgdmlydGlvIHNwZWMgYW5kIGVsaW1pbmF0ZSB0aGUKPj4+
Pj4+IGJ1cmRlbiBvZiB0cmFuc2l0aW9uYWwgZGV2aWNlIGZvciBib3RoIHZEUEEgYnVzIGFuZCB2
RFBBIHBhcmVudC4KPj4+Pj4+Cj4+Pj4+PiB1QVBJIHNlZW1zIGZpbmUgc2luY2UgYWxsIHRoZSB2
RFBBIHBhcmVudCBtYW5kYXRlcwo+Pj4+Pj4gVklSVElPX0ZfQUNDRVNTX1BMQVRGT1JNIHdoaWNo
IGltcGxpZXMgMS4wIGRldmljZXMuCj4+Pj4+Pgo+Pj4+Pj4gRm9yIGxlZ2FjeSBndWVzdHMsIGl0
IGNhbiBzdGlsbCB3b3JrIHNpbmNlIFFlbXUgd2lsbCBtZWRpYXRlIHdoZW4KPj4+Pj4+IG5lY2Vz
c2FyeSAoZS5nIGRvaW5nIHRoZSBlbmRpYW4gY29udmVyc2lvbikuCj4+Pj4+Pgo+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4+Pj4gSG1tLiBJ
ZiB3ZSBkbyB0aGlzLCBkb24ndCB3ZSBzdGlsbCBoYXZlIGEgcHJvYmxlbSB3aXRoCj4+Pj4+IGxl
Z2FjeSBkcml2ZXJzIHdoaWNoIGRvbid0IGFjayAxLjA/Cj4+Pj4gWWVzLCBidXQgaXQncyBub3Qg
c29tZXRoaW5nIHRoYXQgaXMgaW50cm9kdWNlZCBpbiB0aGlzIGNvbW1pdC4gVGhlIGxlZ2FjeQo+
Pj4+IGRyaXZlciBuZXZlciB3b3JrIC4uLgo+Pj4gTXkgcG9pbnQgaXMgdGhpcyBuZWl0aGVyIGZp
eGVzIG9yIHByZXZlbnRzIHRoaXMuCj4+Pgo+Pj4gU28gbXkgc3VnZ2VzdGlvbiBpcyB0byBmaW5h
bGx5IGFkZCBpb2N0bHMgYWxvbmcgdGhlIGxpbmVzCj4+PiBvZiBQUk9UT0NPTF9GRUFUVVJFUyBv
ZiB2aG9zdC11c2VyLgo+Pj4KPj4+IFRoZW4gdGhhdCBvbmUgY2FuIGhhdmUgYml0cyBmb3IgbGVn
YWN5IGxlLCBsZWdhY3kgYmUgYW5kIG1vZGVybi4KPj4+Cj4+PiBCVFcgSSBsb29rZWQgYXQgdmhv
c3QtdXNlciBhbmQgaXQgZG9lcyBub3QgbG9vayBsaWtlIHRoYXQKPj4+IGhhcyBhIHNvbHV0aW9u
IGZvciB0aGlzIHByb2JsZW0gZWl0aGVyLCByaWdodD8KPj4KPj4gUmlnaHQuCj4+Cj4+Cj4+Pgo+
Pj4+PiBOb3RlIDEuMCBhZmZlY3RzIHJpbmcgZW5kaWFubmVzcyB3aGljaCBpcyBub3QgbWVkaWF0
ZWQgaW4gUUVNVQo+Pj4+PiBzbyBRRU1VIGNhbid0IHByZXRlbmQgdG8gZGV2aWNlIGd1ZXN0IGlz
IDEuMC4KPj4+PiBSaWdodCwgSSBwbGFuIHRvIHNlbmQgcGF0Y2hlcyB0byBkbyBtZWRpYXRpb24g
aW4gdGhlIFFlbXUgdG8gdW5icmVhayBsZWdhY3kKPj4+PiBkcml2ZXJzLgo+Pj4+Cj4+Pj4gVGhh
bmtzCj4+PiBJIGZyYW5rbHkgdGhpbmsgd2UnbGwgbmVlZCBQUk9UT0NPTF9GRUFUVVJFUyBhbnl3
YXksIGl0J3MgdG9vIHVzZWZ1bCAuLi4KPj4+IHNvIHdoeSBub3QgdGVhY2ggZHJpdmVycyBhYm91
dCBpdCBhbmQgYmUgZG9uZSB3aXRoIGl0PyBZb3UgY2FuJ3QgZW11bGF0ZQo+Pj4gbGVnYWN5IG9u
IG1vZGVybiBpbiBhIGNyb3NzIGVuZGlhbiBzaXR1YXRpb24gYmVjYXVzZSBvZiB2cmluZwo+Pj4g
ZW5kaWFuLW5lc3MgLi4uCj4+Cj4+IFNvIHRoZSBwcm9ibGVtIHN0aWxsLiBUaGlzIGNhbiBvbmx5
IHdvcmsgd2hlbiB0aGUgaGFyZHdhcmUgY2FuIHN1cHBvcnQKPj4gbGVnYWN5IHZyaW5nIGVuZGlh
bi1uZXNzLgo+Pgo+PiBDb25zaWRlcjoKPj4KPj4gMSkgdGhlIGxlYWdjeSBkcml2ZXIgc3VwcG9y
dCBpcyBub24tbm9ybWF0aXZlIGluIHRoZSBzcGVjCj4+IDIpIHN1cHBvcnQgYSB0cmFuc2l0aW9u
YWwgZGV2aWNlIGluIHRoZSBrZW5yZWwgbWF5IHJlcXVpcmVzIHRoZSBoYXJkd2FyZQo+PiBzdXBw
b3J0IGFuZCBhIGJ1cmRlbiBvZiBrZXJuZWwgY29kZXMKPj4KPj4gSSdkIHJhdGhlciBzaW1wbHkg
ZHJvcCB0aGUgbGVnYWN5IGRyaXZlciBzdXBwb3J0Cj4KPiBNeSBwb2ludCBpcyB0aGlzIHBhdGNo
IGRvZXMgbm90IGRyb3AgbGVnYWN5IHN1cHBvcnQuIEl0IG1lcmVseSBtYW5kYXRlcwo+IG1vZGVy
biBzdXBwb3J0LgoKCkkgYW0gbm90IHN1cmUgSSBnZXQgaGVyZS4gVGhpcyBwYXRjaCBmYWlscyB0
aGUgc2V0X2ZlYXR1cmUgaWYgVkVSU0lPTl8xIAppcyBub3QgbmVnb3RpYXRlZC4gVGhpcyBtZWFu
czoKCjEpIHZEUEEgcHJlc2VudHMgYSBtb2Rlcm4gZGV2aWNlIGluc3RlYWQgb2YgdHJhbnNpdG9u
YWwgZGV2aWNlCjIpIGxlZ2FjeSBkcml2ZXIgY2FuJ3QgYmUgcHJvYmVkCgpXaGF0IEknbSBtaXNz
aW5nPwoKCj4KPj4gdG8gaGF2ZSBhIHNpbXBsZSBhbmQgZWFzeQo+PiBhYnN0YXJjdGlvbiBpbiB0
aGUga2VucmVsLiBGb3IgbGVnYWN5IGRyaXZlciBpbiB0aGUgZ3Vlc3QsIGh5cGVydmlzb3IgaXMg
aW4KPj4gY2hhcmdlIG9mIHRoZSBtZWRpYXRpb246Cj4+Cj4+IDEpIGNvbmZpZyBzcGFjZSBhY2Nl
c3MgZW5kaWFuIGNvbnZlcnNpb24KPj4gMikgdXNpbmcgc2hhZG93IHZpcnRxdWV1ZSB0byBjaGFu
Z2UgdGhlIGVuZGlhbiBpbiB0aGUgdnJpbmcKPj4KPj4gVGhhbmtzCj4gSSdkIGxpa2UgdG8gYXZv
aWQgc2hhZG93IHZpcnRxdWV1ZSBoYWNrcyBpZiBhdCBhbGwgcG9zc2libGUuCj4gTGFzdCBJIGNo
ZWNrZWQgcGVyZm9ybWFuY2Ugd2Fzbid0IG11Y2ggYmV0dGVyIHRoYW4ganVzdCBlbXVsYXRpbmcK
PiB2aXJ0aW8gaW4gc29mdHdhcmUuCgoKSSB0aGluayB0aGUgbGVnYWN5IGRyaXZlciBzdXBwb3J0
IGlzIGp1c3QgYSBuaWNlIHRvIGhhdmUuIE9yIGRvIHlvdSBzZWUgCmFueSB2YWx1ZSB0byB0aGF0
PyBJIGd1ZXNzIGZvciBtZWxsYW5veCBhbmQgaW50ZWwsIG9ubHkgbW9kZXJuIGRldmljZSBpcyAK
c3VwcG9ydGVkIGluIHRoZSBoYXJkd2FyZS4KClRoYW5rcwoKCj4KPj4+Cj4+Pj4+Cj4+Pj4+Cj4+
Pj4+Cj4+Pj4+PiAtLS0KPj4+Pj4+ICAgICBpbmNsdWRlL2xpbnV4L3ZkcGEuaCB8IDYgKysrKysr
Cj4+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4KPj4+Pj4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3ZkcGEuaCBiL2luY2x1ZGUvbGludXgvdmRwYS5o
Cj4+Pj4+PiBpbmRleCAwZmVmZWI5NzY4NzcuLmNmZGU0ZWM5OTliNCAxMDA2NDQKPj4+Pj4+IC0t
LSBhL2luY2x1ZGUvbGludXgvdmRwYS5oCj4+Pj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L3ZkcGEu
aAo+Pj4+Pj4gQEAgLTYsNiArNiw3IEBACj4+Pj4+PiAgICAgI2luY2x1ZGUgPGxpbnV4L2Rldmlj
ZS5oPgo+Pj4+Pj4gICAgICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPj4+Pj4+ICAgICAj
aW5jbHVkZSA8bGludXgvdmhvc3RfaW90bGIuaD4KPj4+Pj4+ICsjaW5jbHVkZSA8dWFwaS9saW51
eC92aXJ0aW9fY29uZmlnLmg+Cj4+Pj4+PiAgICAgLyoqCj4+Pj4+PiAgICAgICogdkRQQSBjYWxs
YmFjayBkZWZpbml0aW9uLgo+Pj4+Pj4gQEAgLTMxNyw2ICszMTgsMTEgQEAgc3RhdGljIGlubGlu
ZSBpbnQgdmRwYV9zZXRfZmVhdHVyZXMoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2LCB1NjQgZmVh
dHVyZXMpCj4+Pj4+PiAgICAgewo+Pj4+Pj4gICAgICAgICAgICAgY29uc3Qgc3RydWN0IHZkcGFf
Y29uZmlnX29wcyAqb3BzID0gdmRldi0+Y29uZmlnOwo+Pj4+Pj4gKyAgICAgICAgLyogTWFuZGF0
aW5nIDEuMCB0byBoYXZlIHNlbWFudGljcyBvZiBub3JtYXRpdmUgc3RhdGVtZW50cyBpbgo+Pj4+
Pj4gKyAgICAgICAgICogdGhlIHNwZWMuICovCj4+Pj4+PiArICAgICAgICBpZiAoIShmZWF0dXJl
cyAmIEJJVF9VTEwoVklSVElPX0ZfVkVSU0lPTl8xKSkpCj4+Pj4+PiArCQlyZXR1cm4gLUVJTlZB
TDsKPj4+Pj4+ICsKPj4+Pj4+ICAgICAJdmRldi0+ZmVhdHVyZXNfdmFsaWQgPSB0cnVlOwo+Pj4+
Pj4gICAgICAgICAgICAgcmV0dXJuIG9wcy0+c2V0X2ZlYXR1cmVzKHZkZXYsIGZlYXR1cmVzKTsK
Pj4+Pj4+ICAgICB9Cj4+Pj4+PiAtLSAKPj4+Pj4+IDIuMjUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
