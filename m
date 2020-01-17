Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C9914060C
	for <lists.virtualization@lfdr.de>; Fri, 17 Jan 2020 10:33:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 81092864D0;
	Fri, 17 Jan 2020 09:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jaCNKoPS9SjY; Fri, 17 Jan 2020 09:33:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BC8A086357;
	Fri, 17 Jan 2020 09:33:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B4D9C077D;
	Fri, 17 Jan 2020 09:33:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F288C077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 219D42046C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gg8zApOrpT78
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:33:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id D56DF203D9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 09:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579253584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHvGcF9xzuVRZeTw2ecPotSnBNnYfAGaG6neQxJf86E=;
 b=dN35GK7zGCUpG0LFQSUBSG1CgLt1FSOGs6m7zva8+yffm/jwGGI3wr/AylucgVT3ycN/T7
 GMFGws07c4tYx5RRAdQD8nvBMxjGGaPcti+njxy9BsSHDqnE9JPifItR2VVyvNYZoeNEHW
 uY4H0fJmi0jE+XgOYZIxVs6kn5qp6UA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-IavVhmtuNH2UPO5_fDnW7w-1; Fri, 17 Jan 2020 04:33:03 -0500
X-MC-Unique: IavVhmtuNH2UPO5_fDnW7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46405107ACC7;
 Fri, 17 Jan 2020 09:33:00 +0000 (UTC)
Received: from [10.72.12.168] (ovpn-12-168.pek2.redhat.com [10.72.12.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 291178121F;
 Fri, 17 Jan 2020 09:32:40 +0000 (UTC)
Subject: Re: [PATCH 5/5] vdpasim: vDPA device simulator
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-6-jasowang@redhat.com>
 <20200116154658.GJ20978@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <aea2bff8-82c8-2c0f-19ee-e86db73e199f@redhat.com>
Date: Fri, 17 Jan 2020 17:32:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200116154658.GJ20978@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>, kuba@kernel.org,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvMS8xNiDkuIvljYgxMTo0NywgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFRo
dSwgSmFuIDE2LCAyMDIwIGF0IDA4OjQyOjMxUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
IFRoaXMgcGF0Y2ggaW1wbGVtZW50cyBhIHNvZnR3YXJlIHZEUEEgbmV0d29ya2luZyBkZXZpY2Uu
IFRoZSBkYXRhcGF0aAo+PiBpcyBpbXBsZW1lbnRlZCB0aHJvdWdoIHZyaW5naCBhbmQgd29ya3F1
ZXVlLiBUaGUgZGV2aWNlIGhhcyBhbiBvbi1jaGlwCj4+IElPTU1VIHdoaWNoIHRyYW5zbGF0ZXMg
SU9WQSB0byBQQS4gRm9yIGtlcm5lbCB2aXJ0aW8gZHJpdmVycywgdkRQQQo+PiBzaW11bGF0b3Ig
ZHJpdmVyIHByb3ZpZGVzIGRtYV9vcHMuIEZvciB2aG9zdCBkcmllcnMsIHNldF9tYXAoKSBtZXRo
b2RzCj4+IG9mIHZkcGFfY29uZmlnX29wcyBpcyBpbXBsZW1lbnRlZCB0byBhY2NlcHQgbWFwcGlu
Z3MgZnJvbSB2aG9zdC4KPj4KPj4gQSBzeXNmcyBiYXNlZCBtYW5hZ2VtZW50IGludGVyZmFjZSBp
cyBpbXBsZW1lbnRlZCwgZGV2aWNlcyBhcmUKPj4gY3JlYXRlZCBhbmQgcmVtb3ZlZCB0aHJvdWdo
Ogo+Pgo+PiAvc3lzL2RldmljZXMvdmlydHVhbC92ZHBhX3NpbXVsYXRvci9uZXRkZXYve2NyZWF0
ZXxyZW1vdmV9Cj4gVGhpcyBpcyB2ZXJ5IGdyb3NzLCBjcmVhdGluZyBhIGNsYXNzIGp1c3QgdG8g
Z2V0IGEgY3JlYXRlL3JlbW92ZSBhbmQKPiB0aGVuIG5vdCB1c2luZyB0aGUgY2xhc3MgZm9yIGFu
eXRoaW5nIGVsc2U/IFl1ay4KCgpJdCBpbmNsdWRlcyBtb3JlIGluZm9ybWF0aW9uLCBlLmcgdGhl
IGRldmljZXMgYW5kIHRoZSBsaW5rIGZyb20gdmRwYV9zaW0gCmRldmljZSBhbmQgdmRwYSBkZXZp
Y2UuCgoKPgo+PiBOZXRsaW5rIGJhc2VkIGxpZmVjeWNsZSBtYW5hZ2VtZW50IGNvdWxkIGJlIGlt
cGxlbWVudGVkIGZvciB2RFBBCj4+IHNpbXVsYXRvciBhcyB3ZWxsLgo+IFRoaXMgaXMganVzdCBi
ZWdnaW5nIGZvciBhIG5ldGxpbmsgYmFzZWQgYXBwcm9hY2guCj4KPiBDZXJ0YWlubHkgbmV0bGlu
ayBkcml2ZW4gcmVtb3ZhbCBzaG91bGQgYmUgYW4gYWdyZWVhYmxlIHN0YW5kYXJkIGZvcgo+IGFs
bCBkZXZpY2VzLCBJIHRoaW5rLgoKCldlbGwsIEkgdGhpbmsgUGFyYXYgaGFkIHNvbWUgcHJvcG9z
YWxzIGR1cmluZyB0aGUgZGlzY3Vzc2lvbiBvZiBtZGV2IAphcHByb2FjaC4gQnV0IEknbSBub3Qg
c3VyZSBpZiBoZSBoYWQgYW55IFJGQyBjb2RlcyBmb3IgbWUgdG8gaW50ZWdyYXRlIAppdCBpbnRv
IHZkcGFzaW0uCgpPciBkbyB5b3Ugd2FudCBtZSB0byBwcm9wb3NlIHRoZSBuZXRsaW5rIEFQST8g
SWYgeWVzLCB3b3VsZCB5b3UgcHJlZmVyIAp0byBhIG5ldyB2aXJ0aW8gZGVkaWNhdGVkIG9uZSBv
ciBiZSBhIHN1YnNldCBvZiBkZXZsaW5rPwoKQnV0IGl0IG1pZ2h0IGJlIGJldHRlciB0byByZWFj
aCBhbiBhZ3JlZW1lbnQgZm9yIGFsbCB0aGUgdmVuZG9ycyBoZXJlLgoKUm9iLCBTdGV2ZSwgVGl3
ZWksIExpbmdzaGFuLCBIYXJwcmVldCwgTWFydGluLCBKYWt1YiwgcGxlYXNlIHNoYXJlIHlvdXIg
CnRob3VnaHRzIGFib3V0IHRoZSBtYW5hZ2VtZW50IEFQSSBoZXJlLgoKCj4KPj4gK3N0cnVjdCB2
ZHBhc2ltX3ZpcnRxdWV1ZSB7Cj4+ICsJc3RydWN0IHZyaW5naCB2cmluZzsKPj4gKwlzdHJ1Y3Qg
dnJpbmdoX2tpb3YgaW92Owo+PiArCXVuc2lnbmVkIHNob3J0IGhlYWQ7Cj4+ICsJYm9vbCByZWFk
eTsKPj4gKwl1NjQgZGVzY19hZGRyOwo+PiArCXU2NCBkZXZpY2VfYWRkcjsKPj4gKwl1NjQgZHJp
dmVyX2FkZHI7Cj4+ICsJdTMyIG51bTsKPj4gKwl2b2lkICpwcml2YXRlOwo+PiArCWlycXJldHVy
bl90ICgqY2IpKHZvaWQgKmRhdGEpOwo+PiArfTsKPj4gKwo+PiArI2RlZmluZSBWRFBBU0lNX1FV
RVVFX0FMSUdOIFBBR0VfU0laRQo+PiArI2RlZmluZSBWRFBBU0lNX1FVRVVFX01BWCAyNTYKPj4g
KyNkZWZpbmUgVkRQQVNJTV9ERVZJQ0VfSUQgMHgxCj4+ICsjZGVmaW5lIFZEUEFTSU1fVkVORE9S
X0lEIDAKPj4gKyNkZWZpbmUgVkRQQVNJTV9WUV9OVU0gMHgyCj4+ICsjZGVmaW5lIFZEUEFTSU1f
Q0xBU1NfTkFNRSAidmRwYV9zaW11bGF0b3IiCj4+ICsjZGVmaW5lIFZEUEFTSU1fTkFNRSAibmV0
ZGV2Igo+PiArCj4+ICt1NjQgdmRwYXNpbV9mZWF0dXJlcyA9ICgxVUxMIDw8IFZJUlRJT19GX0FO
WV9MQVlPVVQpIHwKPj4gKwkJICAgICAgICgxVUxMIDw8IFZJUlRJT19GX1ZFUlNJT05fMSkgIHwK
Pj4gKwkJICAgICAgICgxVUxMIDw8IFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNKTsKPiBJcyBub3Qg
dXNpbmcgc3RhdGljIGhlcmUgaW50ZW50aW9uYWw/CgoKTm8sIGxldCBtZSBmaXguCgoKPgo+PiAr
c3RhdGljIHZvaWQgdmRwYXNpbV9yZWxlYXNlX2RldihzdHJ1Y3QgZGV2aWNlICpfZCkKPj4gK3sK
Pj4gKwlzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEgPSBkZXZfdG9fdmRwYShfZCk7Cj4+ICsJc3Ry
dWN0IHZkcGFzaW0gKnZkcGFzaW0gPSB2ZHBhX3RvX3NpbSh2ZHBhKTsKPj4gKwo+PiArCXN5c2Zz
X3JlbW92ZV9saW5rKHZkcGFzaW1fZGV2LT5kZXZpY2VzX2tvYmosIHZkcGFzaW0tPm5hbWUpOwo+
PiArCj4+ICsJbXV0ZXhfbG9jaygmdnNpbV9saXN0X2xvY2spOwo+PiArCWxpc3RfZGVsKCZ2ZHBh
c2ltLT5uZXh0KTsKPj4gKwltdXRleF91bmxvY2soJnZzaW1fbGlzdF9sb2NrKTsKPj4gKwo+PiAr
CWtmcmVlKHZkcGFzaW0tPmJ1ZmZlcik7Cj4+ICsJa2ZyZWUodmRwYXNpbSk7Cj4+ICt9Cj4gSXQg
aXMgYWdhaW4gYSBiaXQgd2VpcmQgdG8gc2VlIGEgcmVhbGVhc2UgZnVuY3Rpb24gaW4gYSBkcml2
ZXIuIFRoaXMKPiBzdHVmZiBpcyB1c3VhbGx5IGluIHRoZSByZW1vdmUgcmVtb3ZlIGZ1bmN0aW9u
LgoKCldpbGwgZml4LgoKCj4KPj4gK3N0YXRpYyBpbnQgdmRwYXNpbV9jcmVhdGUoY29uc3QgZ3Vp
ZF90ICp1dWlkKQo+PiArewo+PiArCXN0cnVjdCB2ZHBhc2ltICp2ZHBhc2ltLCAqdG1wOwo+PiAr
CXN0cnVjdCB2aXJ0aW9fbmV0X2NvbmZpZyAqY29uZmlnOwo+PiArCXN0cnVjdCB2ZHBhX2Rldmlj
ZSAqdmRwYTsKPj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4+ICsJaW50IHJldCA9IC1FTk9NRU07
Cj4+ICsKPj4gKwltdXRleF9sb2NrKCZ2c2ltX2xpc3RfbG9jayk7Cj4+ICsJbGlzdF9mb3JfZWFj
aF9lbnRyeSh0bXAsICZ2c2ltX2RldmljZXNfbGlzdCwgbmV4dCkgewo+PiArCQlpZiAoZ3VpZF9l
cXVhbCgmdG1wLT51dWlkLCB1dWlkKSkgewo+PiArCQkJbXV0ZXhfdW5sb2NrKCZ2c2ltX2xpc3Rf
bG9jayk7Cj4+ICsJCQlyZXR1cm4gLUVFWElTVDsKPj4gKwkJfQo+PiArCX0KPj4gKwo+PiArCXZk
cGFzaW0gPSBremFsbG9jKHNpemVvZigqdmRwYXNpbSksIEdGUF9LRVJORUwpOwo+PiArCWlmICgh
dmRwYXNpbSkKPj4gKwkJZ290byBlcnJfdmRwYV9hbGxvYzsKPj4gKwo+PiArCXZkcGFzaW0tPmJ1
ZmZlciA9IGttYWxsb2MoUEFHRV9TSVpFLCBHRlBfS0VSTkVMKTsKPj4gKwlpZiAoIXZkcGFzaW0t
PmJ1ZmZlcikKPj4gKwkJZ290byBlcnJfYnVmZmVyX2FsbG9jOwo+PiArCj4+ICsJdmRwYXNpbS0+
aW9tbXUgPSB2aG9zdF9pb3RsYl9hbGxvYygyMDQ4LCAwKTsKPj4gKwlpZiAoIXZkcGFzaW0tPmlv
bW11KQo+PiArCQlnb3RvIGVycl9pb3RsYjsKPj4gKwo+PiArCWNvbmZpZyA9ICZ2ZHBhc2ltLT5j
b25maWc7Cj4+ICsJY29uZmlnLT5tdHUgPSAxNTAwOwo+PiArCWNvbmZpZy0+c3RhdHVzID0gVklS
VElPX05FVF9TX0xJTktfVVA7Cj4+ICsJZXRoX3JhbmRvbV9hZGRyKGNvbmZpZy0+bWFjKTsKPj4g
Kwo+PiArCUlOSVRfV09SSygmdmRwYXNpbS0+d29yaywgdmRwYXNpbV93b3JrKTsKPj4gKwlzcGlu
X2xvY2tfaW5pdCgmdmRwYXNpbS0+bG9jayk7Cj4+ICsKPj4gKwlndWlkX2NvcHkoJnZkcGFzaW0t
PnV1aWQsIHV1aWQpOwo+PiArCj4+ICsJbGlzdF9hZGQoJnZkcGFzaW0tPm5leHQsICZ2c2ltX2Rl
dmljZXNfbGlzdCk7Cj4+ICsJdmRwYSA9ICZ2ZHBhc2ltLT52ZHBhOwo+PiArCj4+ICsJbXV0ZXhf
dW5sb2NrKCZ2c2ltX2xpc3RfbG9jayk7Cj4+ICsKPj4gKwl2ZHBhID0gJnZkcGFzaW0tPnZkcGE7
Cj4+ICsJdmRwYS0+Y29uZmlnID0gJnZkcGFzaW1fbmV0X2NvbmZpZ19vcHM7Cj4+ICsJdmRwYV9z
ZXRfcGFyZW50KHZkcGEsICZ2ZHBhc2ltX2Rldi0+ZGV2KTsKPj4gKwl2ZHBhLT5kZXYucmVsZWFz
ZSA9IHZkcGFzaW1fcmVsZWFzZV9kZXY7Cj4+ICsKPj4gKwl2cmluZ2hfc2V0X2lvdGxiKCZ2ZHBh
c2ltLT52cXNbMF0udnJpbmcsIHZkcGFzaW0tPmlvbW11KTsKPj4gKwl2cmluZ2hfc2V0X2lvdGxi
KCZ2ZHBhc2ltLT52cXNbMV0udnJpbmcsIHZkcGFzaW0tPmlvbW11KTsKPj4gKwo+PiArCWRldiA9
ICZ2ZHBhLT5kZXY7Cj4+ICsJZGV2LT5jb2hlcmVudF9kbWFfbWFzayA9IERNQV9CSVRfTUFTSyg2
NCk7Cj4+ICsJc2V0X2RtYV9vcHMoZGV2LCAmdmRwYXNpbV9kbWFfb3BzKTsKPj4gKwo+PiArCXJl
dCA9IHJlZ2lzdGVyX3ZkcGFfZGV2aWNlKHZkcGEpOwo+PiArCWlmIChyZXQpCj4+ICsJCWdvdG8g
ZXJyX3JlZ2lzdGVyOwo+PiArCj4+ICsJc3ByaW50Zih2ZHBhc2ltLT5uYW1lLCAiJXBVIiwgdXVp
ZCk7Cj4+ICsKPj4gKwlyZXQgPSBzeXNmc19jcmVhdGVfbGluayh2ZHBhc2ltX2Rldi0+ZGV2aWNl
c19rb2JqLCAmdmRwYS0+ZGV2LmtvYmosCj4+ICsJCQkJdmRwYXNpbS0+bmFtZSk7Cj4+ICsJaWYg
KHJldCkKPj4gKwkJZ290byBlcnJfbGluazsKPiBUaGUgZ290byBlcnJfbGluayBkb2VzIHRoZSB3
cm9uZyB1bndpbmQsIG9uY2UgcmVnaXN0ZXIgaXMgY29tcGxldGVkCj4gdGhlIGVycm9yIHVud2lu
ZCBpcyB1bnJlZ2lzdGVyICYgcHV0X2RldmljZSwgbm90IGtmcmVlLiBUaGlzIGlzIHdoeSBJCj4g
cmVjb21tZW5kIHRvIGFsd2F5cyBpbml0YWxpemUgdGhlIGRldmljZSBlYXJseSwgYW5kIGFsd2F5
cyB1c2luZwo+IHB1dF9kZXZpY2UgZHVyaW5nIGVycm9yIHVud2luZHMuCgoKV2lsbCBmaXguCgoK
Pgo+IFRoaXMgd2hvbGUgZ3VpZCB0aGluZyBzZWVtcyB1bm5jZXNzYXJ5IHdoZW4gdGhlIGRldmlj
ZSBpcyBpbW1lZGlhdGVseQo+IGFzc2lnbmVkIGEgdmRwYSBpbmRleCBmcm9tIHRoZSBpZGEuCgoK
VGhlIHByb2JsZW0gaGVyZSBpcyB0aGF0IHVzZXIgbmVlZCB0byBrbm93IHdoaWNoIHZkcGFfc2lt
IGlzIHRoZSBvbmUgCnRoYXQgaXMganVzdCBjcmVhdGVkLgoKCj4gSWYgeW91IHdlcmUgbm90IHVz
aW5nIHN5ZnMgeW91J2QKPiBqdXN0IHJldHVybiB0aGF0IGluZGV4IGZyb20gdGhlIGNyZWF0aW9u
IG5ldGxpbmsuCgoKWWVzIGl0IGlzLgoKVGhhbmtzCgoKPgo+IEphc29uCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
