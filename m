Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B8259223778
	for <lists.virtualization@lfdr.de>; Fri, 17 Jul 2020 10:57:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E70988191;
	Fri, 17 Jul 2020 08:57:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wAQdmmW0ZpjB; Fri, 17 Jul 2020 08:57:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 69A708817F;
	Fri, 17 Jul 2020 08:57:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34B53C0733;
	Fri, 17 Jul 2020 08:57:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 967B4C0733
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 08:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7C69585F18
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 08:57:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54mfejNIRmZt
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 08:57:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3548485E7D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594976270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQa1wFx5ju/viAYDB8r5LMbz53CJrK3UU1097v6vI8w=;
 b=P0oRW8447bmypg5taeu8hmwa0TeCBKZ9UzeeBPXcfT2G7qc/a/xQ0c8xwQxwV6P3hwyn7j
 FOLdSVYqy3BWh139TZJ9op0rfYaQq4nAjXoYav8hPxANqrxivz0uJHop/MTOjc/wg9Wzlv
 6hvTJLT/tcvAnbJcANv9Cwf3ww+rx8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-ekLXpjRWNKaONGIx0y8cMA-1; Fri, 17 Jul 2020 04:57:47 -0400
X-MC-Unique: ekLXpjRWNKaONGIx0y8cMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2DCB800400;
 Fri, 17 Jul 2020 08:57:45 +0000 (UTC)
Received: from [10.72.12.157] (ovpn-12-157.pek2.redhat.com [10.72.12.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF1C472AF1;
 Fri, 17 Jul 2020 08:57:35 +0000 (UTC)
Subject: Re: [PATCH vhost next 10/10] vdpa/mlx5: Add VDPA driver for supported
 mlx5 devices
To: Eli Cohen <eli@mellanox.com>
References: <20200716072327.5359-1-eli@mellanox.com>
 <20200716072327.5359-11-eli@mellanox.com>
 <454850cc-269b-72aa-4511-2bf793a215cc@redhat.com>
 <20200716115428.GC186790@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b85ecb97-2120-f63f-f5f4-01d90f88d666@redhat.com>
Date: Fri, 17 Jul 2020 16:57:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716115428.GC186790@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: shahafs@mellanox.com, Parav Pandit <parav@mellanox.com>, mst@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 saeedm@mellanox.com
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

Ck9uIDIwMjAvNy8xNiDkuIvljYg3OjU0LCBFbGkgQ29oZW4gd3JvdGU6Cj4gT24gVGh1LCBKdWwg
MTYsIDIwMjAgYXQgMDU6MTQ6MzJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+ICtzdGF0
aWMgdm9pZCBzdXNwZW5kX3ZxcyhzdHJ1Y3QgbWx4NV92ZHBhX25ldCAqbmRldikKPj4+ICt7Cj4+
PiArCWludCBpOwo+Pj4gKwo+Pj4gKwlmb3IgKGkgPSAwOyBpIDwgTUxYNV9NQVhfU1VQUE9SVEVE
X1ZRUzsgaSsrKQo+Pj4gKwkJc3VzcGVuZF92cShuZGV2LCAmbmRldi0+dnFzW2ldKTsKPj4KPj4g
SW4gdGVhcmRvd25fdmlydHF1ZXVlcygpIGl0IGhhcyBhIGNoZWNrIG9mIG12cS0+bnVtX2VudCwg
YW55IHJlYXNvbgo+PiBub3QgZG9pbmcgaXQgaGVyZT8KPj4KPiBMb29rcyBsaWtlIGNoZWNraW5n
IGludGlhbGl6ZWQgaXMgZW5vdWdoLiBXaWxsIGZpeCB0aGlzLgo+ICAgCj4+PiArCj4+PiArc3Rh
dGljIHZvaWQgbWx4NV92ZHBhX3NldF92cV9yZWFkeShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYs
IHUxNiBpZHgsIGJvb2wgcmVhZHkpCj4+PiArewo+Pj4gKwlzdHJ1Y3QgbWx4NV92ZHBhX2RldiAq
bXZkZXYgPSB0b19tdmRldih2ZGV2KTsKPj4+ICsJc3RydWN0IG1seDVfdmRwYV9uZXQgKm5kZXYg
PSB0b19tbHg1X3ZkcGFfbmRldihtdmRldik7Cj4+PiArCXN0cnVjdCBtbHg1X3ZkcGFfdmlydHF1
ZXVlICptdnEgPSAmbmRldi0+dnFzW2lkeF07Cj4+PiArCWludCBlcnI7Cj4+PiArCj4+PiArCWlm
ICghbXZxLT5yZWFkeSAmJiByZWFkeSAmJiBtdnEtPmZ3X3N0YXRlICE9IE1MWDVfVklSVElPX05F
VF9RX09CSkVDVF9TVEFURV9SRFkpIHsKPj4+ICsJCWVyciA9IG1vZGlmeV92aXJ0cXVldWUobmRl
diwgbXZxLCBNTFg1X1ZJUlRJT19ORVRfUV9PQkpFQ1RfU1RBVEVfUkRZKTsKPj4+ICsJCWlmIChl
cnIpIHsKPj4+ICsJCQltbHg1X3ZkcGFfd2FybihtdmRldiwgImZhaWxlZCB0byBtb2RpZnkgdmly
dHF1ZXVlKCVkKVxuIiwgZXJyKTsKPj4+ICsJCQlyZXR1cm47Cj4+PiArCQl9Cj4+PiArCX0KPj4K
Pj4gSSB3b25kZXIgd2hhdCdzIHRoZSByZWFzb24gb2YgY2hhbmdpbmcgdnEgc3RhdGUgb24gdGhl
IGhhcmR3YXJlCj4+IGhlcmUuIEkgdGhpbmsgd2UgY2FuIGRlZmVyIGl0IHRvIHNldF9zdGF0dXMo
KS4KPj4KPiBJIGNhbiBkZWZlciB0aGlzIHRvIHNldCBzdGF0dXMuCj4KPiBJIGp1c3Qgd29uZGVy
IGlmIGl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlIGNvcmUgdmRwYSBkcml2ZXIgbWF5IGNhbGwgdGhp
cwo+IGZ1bmN0aW9uIHdpdGggcmVhZHkgZXF1YWxzIGZhbHNlIGFuZCBhZnRlciBzb21lIHRpbWUg
Y2FsbCBpdCB3aXRoIHJlYWR5Cj4gZXF1YWxzIHRydWUuCgoKR29vZCBwb2ludCwgc28gSSB0aGlu
ayB3ZSBjYW4ga2VlcCB0aGUgbG9naWMuIEJ1dCBsb29rcyBsaWtlIHRoZSBjb2RlIApjYW4gbm90
IHdvcmsgaWYgcmVhZHkgZXF1YWxzIGZhbHNlIHNpbmNlIGl0IG9ubHkgdHJpZXMgdG8gbW9kaWZ5
IHZxIApzdGF0ZSB0byBSRFkuCgoKPgo+Cj4+IChBbnlob3cgd2UgZG9uJ3Qgc3luYyB2cSBhZGRy
ZXNzIGluIHNldF92cV9hZGRyZXNzKCkpLgo+Pgo+Pgo+Pj4gK3N0YXRpYyB1NjQgbWx4NV92ZHBh
X2dldF9mZWF0dXJlcyhzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYpCj4+PiArewo+Pj4gKwlzdHJ1
Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYgPSB0b19tdmRldih2ZGV2KTsKPj4+ICsJc3RydWN0IG1s
eDVfdmRwYV9uZXQgKm5kZXYgPSB0b19tbHg1X3ZkcGFfbmRldihtdmRldik7Cj4+PiArCXUxNiBk
ZXZfZmVhdHVyZXM7Cj4+PiArCj4+PiArCWRldl9mZWF0dXJlcyA9IE1MWDVfQ0FQX0RFVl9WRFBB
X0VNVUxBVElPTihtdmRldi0+bWRldiwgZGV2aWNlX2ZlYXR1cmVzX2JpdHNfbWFzayk7Cj4+PiAr
CW5kZXYtPm12ZGV2Lm1seF9mZWF0dXJlcyA9IG1seF90b192cml0aW9fZmVhdHVyZXMoZGV2X2Zl
YXR1cmVzKTsKPj4+ICsJaWYgKE1MWDVfQ0FQX0RFVl9WRFBBX0VNVUxBVElPTihtdmRldi0+bWRl
diwgdmlydGlvX3ZlcnNpb25fMV8wKSkKPj4+ICsJCW5kZXYtPm12ZGV2Lm1seF9mZWF0dXJlcyB8
PSBCSVQoVklSVElPX0ZfVkVSU0lPTl8xKTsKPj4KPj4gVGhpcyBpcyBpbnRlcmVzdGluZy4gVGhp
cyBzdWdnZXN0cyAhVklSVElPX0ZfVkVSU0lPTl8xICYmCj4+IFZJUlRJT19GX0lPTU1VX1BMQVRG
T1JNIGlzIHZhbGlkLiBCdXQgdmlyaXRvIHNwZWMgZG9lc24ndCBhbGxvdyBzdWNoCj4+IGNvbmZp
Z3VyYXRpb24uCj4gV2lsbCBmaXgKPj4gU28gSSB0aGluayB5b3UgbmVlZCBlaXRoZXI6Cj4+Cj4+
IDEpIEZhaWwgdkRQQSBkZXZpY2UgcHJvYmUgd2hlbiBWRVJTSU9OXzEgaXMgbm90IHN1cHBvcnRl
ZAo+PiAyKSBjbGVhciBJT01NVV9QTEFURk9STSBpZiBWRVJTSU9OXzEgaXMgbm90IG5lZ290aWF0
ZWQKPj4KPj4gRm9yIDIpIEkgZ3Vlc3MgaXQgY2FuJ3Qgd29yaywgYWNjb3JkaW5nIHRvIHRoZSBz
cGVjLCB3aXRob3V0Cj4+IElPTU1VX1BMQVRGT1JNLCBkZXZpY2UgbmVlZCB0byB1c2UgUEEgdG8g
YWNjZXNzIHRoZSBtZW1vcnkKPj4KPj4KPj4+ICsJbmRldi0+bXZkZXYubWx4X2ZlYXR1cmVzIHw9
IEJJVChWSVJUSU9fRl9BTllfTEFZT1VUKTsKPiBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlIHJlbW92
ZWQgdG9vCgoKWWVzLCBJIGd1ZXNzIGZvciBoYXJkd2FyZSB2RFBBIHdoaWNoIGRlcGVuZHMgb24g
SU9NTVVfUExBVEZPUk0gd2hpY2ggCmltcGxpZXMgVkVSU0lPTl8xIHRoYXQgaW1wbGllcyBBTllf
TEFZT1VULgoKCj4KPj4+ICsJbmRldi0+bXZkZXYubWx4X2ZlYXR1cmVzIHw9IEJJVChWSVJUSU9f
Rl9JT01NVV9QTEFURk9STSk7Cj4+PiArCWlmIChtbHg1X3ZkcGFfbWF4X3FwcyhuZGV2LT5tdmRl
di5tYXhfdnFzKSA+IDEpCj4+PiArCQluZGV2LT5tdmRldi5tbHhfZmVhdHVyZXMgfD0gQklUKFZJ
UlRJT19ORVRfRl9NUSk7Cj4gQWxzbyB0aGlzLCBzaW5jZSBtdWx0cXVldWUgcmVxdWlyZXMgY29u
ZmlndXJhdGlvbiB2cSB3aGljaCBpcyBub3QKPiBzdXBwb3J0ZWQgaW4gdGhpcyB2ZXJzaW9uLgoK
Clllcy4KCgo+Cj4+PiArCj4+PiArCXByaW50X2ZlYXR1cmVzKG12ZGV2LCBuZGV2LT5tdmRldi5t
bHhfZmVhdHVyZXMsIGZhbHNlKTsKPj4+ICsJcmV0dXJuIG5kZXYtPm12ZGV2Lm1seF9mZWF0dXJl
czsKPj4+ICt9Cj4+PiArCj4+PiArc3RhdGljIGludCB2ZXJpZnlfbWluX2ZlYXR1cmVzKHN0cnVj
dCBtbHg1X3ZkcGFfZGV2ICptdmRldiwgdTY0IGZlYXR1cmVzKQo+Pj4gK3sKPj4+ICsJLyogRklY
TUU6IHFlbXUgY3VycmVudGx5IGRvZXMgbm90IHNldCBhbGwgdGhlIGZlYXVyZXMgZHVlIHRvIGEg
YnVnLgo+Pj4gKwkgKiBBZGQgY2hlY2tzIHdoZW4gdGhpcyBpcyBmaXhlZC4KPj4+ICsJICovCj4+
Cj4+IEkgdGhpbmsgd2Ugc2hvdWxkIGFkZCB0aGUgY2hlY2sgbm93IHRoZW4gcWVtdSBjYW4gZ2V0
IG5vdGlmaWVkLiAoRS5nCj4+IElPTU1VX1BMQVRGT1JNKQo+IFdpbGwgZG8uCj4+Cj4+PiArfQo+
Pj4gKwo+Pj4gKyNkZWZpbmUgTUxYNV9WRFBBX01BWF9WUV9FTlRSSUVTIDI1Ngo+Pgo+PiBJcyB0
aGlzIGEgaGFyZHdhcmUgbGltaXRhdGlvbiwgcWVtdSBjYW4gc3VwcG9ydCB1cCB0byAxSyB3aGlj
aCB0aGUKPj4gcmVxdWlyZW1lbnQgb2Ygc29tZSBORlYgY2FzZXMuCj4+Cj4gVGhlb3JldGljYWxs
eSB0aGUgZGV2aWNlIGlzIGxpbWl0IGlzIG11Y2ggaGlnaGVyLiBJbiB0aGUgbmVhciBmdXR1cmUg
d2UKPiB3aWxsIGhhdmUgYSBkZXZpY2UgY2FwYWJpbGl0eSBmb3IgdGhpcy4gSSB3YW50ZWQgdG8g
c3RheSBvbiB0aGUgc2FmZSBzaWRlCj4gd2l0aCB0aGlzIGJ1dCBJIGNhbiBjaGFuZ2UgdGhpcyBp
ZiB5b3UgdGhpbmsgaXQncyBuZWNlc3NhcnkuCgoKSSBzZWUsIHRoYXQncyBmaW5lLiBMZXQga2Vl
cCB0aGlzIHVudG91Y2hlZC4KCgo+Pj4gKwo+Pj4gK3N0YXRpYyB2b2lkIG1seDVfdmRwYV9nZXRf
Y29uZmlnKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwgdW5zaWduZWQgaW50IG9mZnNldCwgdm9p
ZCAqYnVmLAo+Pj4gKwkJCQkgdW5zaWduZWQgaW50IGxlbikKPj4+ICt7Cj4+PiArCXN0cnVjdCBt
bHg1X3ZkcGFfZGV2ICptdmRldiA9IHRvX212ZGV2KHZkZXYpOwo+Pj4gKwlzdHJ1Y3QgbWx4NV92
ZHBhX25ldCAqbmRldiA9IHRvX21seDVfdmRwYV9uZGV2KG12ZGV2KTsKPj4+ICsKPj4+ICsJaWYg
KG9mZnNldCArIGxlbiA8IHNpemVvZihzdHJ1Y3QgdmlydGlvX25ldF9jb25maWcpKQo+Pj4gKwkJ
bWVtY3B5KGJ1ZiwgJm5kZXYtPmNvbmZpZyArIG9mZnNldCwgbGVuKTsKPj4KPj4gTm90ZSB0aGF0
IGd1ZXN0IGV4cGVjdCBMRSwgd2hhdCdzIHRoZSBlbmRpYW4gZm9yIG5kZXYtPmNvbmZpZz8KPiBU
aGlzIGlzIHN0cnVjdCB2aXJ0aW9fbmV0X2NvbmZpZyBmcm9tIGluY2x1ZGUvdWFwaS9saW51eC92
aXJ0aW9fbmV0LmguCj4gTG9va2luZyB0aGVyZSBJIHNlZSBpdCBoYXMgbWl4ZWQgZW5kaWFuZXNz
LiBJIGN1cnJlbnRseSBkb24ndCB0b3VjaCBpdAo+IGJ1dCBpZiBJIGRvLCBJIHNob3VsZCBmb2xs
b3cgZW5kaWFuZXNzIGd1aWRhbmNlIHBlciB0aGUgc3RydWN0Cj4gZGVmaW5pdGlvbi4gU28gSSBk
b24ndCB0aGluayBJIHNob3VsZCBjYXJlIGFib3V0IGVuZGlhbmVzcyB3aGVuIGNvcHlpbmcuCgoK
U28gZ3Vlc3Qgd291bGQgZXhwZWN0IExFLCB3ZSBuZWVkIGJlIGNhcmVmdWwgd2hlbiBtb2RpZnkg
Y29uZmlnIHNwYWNlIAooZS5nIG10dSBvciBzdGF0dXMpLiBDb25zaWRlciB3ZSBkb24ndCBzdXBw
b3J0IFZJUlRJT19ORVRfRl9TVEFUVVMgYW5kIApWSVJUSU9fTkVUX0ZfTVRVLCB3ZSdyZSBwcm9i
YWJseSBmaW5lLgoKCj4KPj4KPj4+ICt9Cj4+PiArCj4+PiArc3RhdGljIHZvaWQgbWx4NV92ZHBh
X3NldF9jb25maWcoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0
LCBjb25zdCB2b2lkICpidWYsCj4+PiArCQkJCSB1bnNpZ25lZCBpbnQgbGVuKQo+Pj4gK3sKPj4+
ICsJLyogbm90IHN1cHBvcnRlZCAqLwo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgdTMyIG1seDVf
dmRwYV9nZXRfZ2VuZXJhdGlvbihzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYpCj4+PiArewo+Pj4g
KwlzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYgPSB0b19tdmRldih2ZGV2KTsKPj4+ICsKPj4+
ICsJcmV0dXJuIG12ZGV2LT5nZW5lcmF0aW9uOwo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgaW50
IG1seDVfdmRwYV9zZXRfbWFwKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwgc3RydWN0IHZob3N0
X2lvdGxiICppb3RsYikKPj4+ICt7Cj4+PiArCXN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiA9
IHRvX212ZGV2KHZkZXYpOwo+Pj4gKwlzdHJ1Y3QgbWx4NV92ZHBhX25ldCAqbmRldiA9IHRvX21s
eDVfdmRwYV9uZGV2KG12ZGV2KTsKPj4+ICsJYm9vbCBjaGFuZ2VfbWFwOwo+Pj4gKwlpbnQgZXJy
Owo+Pj4gKwo+Pj4gKwllcnIgPSBtbHg1X3ZkcGFfaGFuZGxlX3NldF9tYXAobXZkZXYsIGlvdGxi
LCAmY2hhbmdlX21hcCk7Cj4+PiArCWlmIChlcnIpIHsKPj4+ICsJCW1seDVfdmRwYV93YXJuKG12
ZGV2LCAic2V0IG1hcCBmYWlsZWQoJWQpXG4iLCBlcnIpOwo+Pj4gKwkJcmV0dXJuIGVycjsKPj4+
ICsJfQo+Pj4gKwo+Pj4gKwlpZiAoY2hhbmdlX21hcCkKPj4+ICsJCXJldHVybiBtbHg1X3ZkcGFf
Y2hhbmdlX21hcChuZGV2LCBpb3RsYik7Cj4+Cj4+IEFueSByZWFzb24gZm9yIG5vdCBkb2luZyB0
aGlzIGluc2lkZSBtbHg1X2hhbmRsZV9zZXRfbWFwKCk/Cj4+Cj4gQWxsIG1lbW9yeSByZWdpc3Ry
YXRpb24gcmVsYXRlZCBvcGVyYXRpb25zIGFyZSBkb25lIGluc2lkZSBtci5jIGluIHRoZQo+IGNv
bW1vbiBjb2RlIGRpcmVjdG9yeS4gQnV0IGNoYW5nZSBtYXAgaW52b2x2ZXMgb3BlcmF0aW9ucyBv
biBvdGhlcgo+IG9iamVjdHMgbWFuYWdlZCBpbiB0aGlzIGZpbGUuCgoKT2suCgooTm90ZSB0aGF0
IHdlIGNhbiBkbyBtb3JlIGdlbmVyYWxpemF0aW9uIGluIHRoZSBmdXR1cmUsIHNpbmNlIHRoZSBv
bmx5IApuZXR3b3JrIHNwZWNpZmljIHBhcnQgaXMgdGhlIGNvbmZpZyBzcGFjZSBhbmQgY29udHJv
bCB2cSkKCgo+Cj4+PiArCj4+PiArdm9pZCBtbHg1X3ZkcGFfcmVtb3ZlX2RldihzdHJ1Y3QgbWx4
NV92ZHBhX2RldiAqbXZkZXYpCj4+PiArewo+Pj4gKwlzdHJ1Y3QgbWx4NV92ZHBhX25ldCAqbmRl
djsKPj4+ICsKPj4+ICsJbXZkZXYtPnN0YXR1cyA9IDA7Cj4+Cj4+IFRoaXMgaXMgcHJvYmFibHkg
dW5uZWNlc3NhcnkuCj4+Cj4gUmlnaHQsIHdpbGwgcmVtb3ZlLgoKClRoYW5rcwoKCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
