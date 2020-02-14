Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E2315D0DF
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 05:06:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 44719863DB;
	Fri, 14 Feb 2020 04:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vVhwGzQmTztt; Fri, 14 Feb 2020 04:06:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7D95D864F2;
	Fri, 14 Feb 2020 04:06:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50F36C0177;
	Fri, 14 Feb 2020 04:06:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E54DDC0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 04:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CEA8B2048B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 04:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rIQm9-xCXDWz
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 04:06:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 9AC1C1FE2F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 04:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581653160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1xIK/TCy6JocWI9iXEP20gpQgUBQR0k0L01ueOgMC6U=;
 b=BrBGfJDy5faiWxvswhMKFePTV0mc5DB46hzVA2A4dPoqJcJMelz/tgu+tKCVsYMRUwE5br
 xxGPttUtWZ9f1meM0NZv3qfqfH93zHurM9tilT3CHCtJHpoBHsxc1pQcuDEHvPovviyeHy
 sP0KfnzUqLj5UQAdUFYV3WDzfHTEACs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-6SAUathIOGSb9suc0ErvHg-1; Thu, 13 Feb 2020 23:05:56 -0500
X-MC-Unique: 6SAUathIOGSb9suc0ErvHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2715800D41;
 Fri, 14 Feb 2020 04:05:53 +0000 (UTC)
Received: from [10.72.13.213] (ovpn-13-213.pek2.redhat.com [10.72.13.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 327E55DA83;
 Fri, 14 Feb 2020 04:05:33 +0000 (UTC)
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
To: Jason Gunthorpe <jgg@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200211134746.GI4271@mellanox.com>
 <cf7abcc9-f8ef-1fe2-248e-9b9028788ade@redhat.com>
 <20200212125108.GS4271@mellanox.com>
 <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
 <20200213134128.GV4271@mellanox.com>
 <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
 <20200213150542.GW4271@mellanox.com>
 <20200213103714-mutt-send-email-mst@kernel.org>
 <20200213155154.GX4271@mellanox.com>
 <20200213105425-mutt-send-email-mst@kernel.org>
 <20200213162407.GZ4271@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5625f971-0455-6463-2c0a-cbca6a1f8271@redhat.com>
Date: Fri, 14 Feb 2020 12:05:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200213162407.GZ4271@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 haotian.wang@sifive.com, shahafs@mellanox.com, parav@mellanox.com,
 jiri@mellanox.com, xiao.w.wang@intel.com, stefanha@redhat.com,
 zhihong.wang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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

Ck9uIDIwMjAvMi8xNCDkuIrljYgxMjoyNCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFRo
dSwgRmViIDEzLCAyMDIwIGF0IDEwOjU2OjAwQU0gLTA1MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3
cm90ZToKPj4gT24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMTE6NTE6NTRBTSAtMDQwMCwgSmFzb24g
R3VudGhvcnBlIHdyb3RlOgo+Pj4+IFRoYXQgYnVzIGlzIGV4YWN0bHkgd2hhdCBHcmVnIEtIIHBy
b3Bvc2VkLiBUaGVyZSBhcmUgb3RoZXIgd2F5cwo+Pj4+IHRvIHNvbHZlIHRoaXMgSSBndWVzcyBi
dXQgdGhpcyBiaWtlc2hlZGRpbmcgaXMgZ2V0dGluZyB0aXJpbmcuCj4+PiBUaGlzIGRpc2N1c3Np
b24gd2FzIGZvciBhIGRpZmZlcmVudCBnb2FsLCBJTUhPLgo+PiBIbW0gY291bGRuJ3QgZmluZCBp
dCBhbnltb3JlLiBXaGF0IHdhcyB0aGUgZ29hbCB0aGVyZSBpbiB5b3VyIG9waW5pb24/Cj4gSSB0
aGluayBpdCB3YXMgbGFyZ2VseSB0YWxraW5nIGFib3V0IGhvdyB0byBtb2RlbCB0aGluZ3MgbGlr
ZQo+IEFESS9TRi9ldGMsIHBsdXMgc3R1ZmYgZ290IHZlcnkgY29uZnVzZWQgd2hlbiB0aGUgZGlz
Y3Vzc2lvbiB0cmllZCB0bwo+IGV4cGxhaW4gd2hhdCBtZGV2J3Mgcm9sZSB3YXMgdnMgdGhlIGRy
aXZlciBjb3JlLgo+Cj4gVGhlIHN0YW5kYXJkIGRyaXZlciBtb2RlbCBpcyBhICdidXMnIGRyaXZl
ciBwcm92aWRlcyB0aGUgSFcgYWNjZXNzCj4gKHRoaW5rIFBDSSBsZXZlbCB0aGluZ3MpLCBhbmQg
YSAnaHcgZHJpdmVyJyBhdHRhY2hlcyB0byB0aGUgYnVzCj4gZGV2aWNlLAoKClRoaXMgaXMgbm90
IHRydWUsIGtlcm5lbCBoYWQgYWxyZWFkeSBoYWQgcGxlbnR5IHZpcnR1YWwgYnVzIHdoZXJlIAp2
aXJ0dWFsIGRldmljZXMgYW5kIGRyaXZlcnMgY291bGQgYmUgYXR0YWNoZWQsIGJlc2lkZXMgbWRl
diBhbmQgdmlydGlvLCAKeW91IGNhbiBzZWUgdm9wLCBycG1zZywgdmlzb3JidXMgZXRjLgoKCj4g
YW5kIGluc3RhbnRpYXRlcyBhICdzdWJzeXN0ZW0gZGV2aWNlJyAodGhpbmsgbmV0ZGV2LCByZG1h
LAo+IGV0YykgdXNpbmcgc29tZSBwZXItc3Vic3lzdGVtIFhYWF9yZWdpc3RlcigpLgoKCldlbGws
IGlmIHlvdSBnbyB0aHJvdWdoIHZpcnRpbyBzcGVjLCB3ZSBzdXBwb3J0IH4yMCB0eXBlcyBvZiBk
aWZmZXJlbnQgCmRldmljZXMuIENsYXNzZXMgbGlrZSBuZXRkZXYgYW5kIHJkbWEgYXJlIGNvcnJl
Y3Qgc2luY2UgdGhleSBoYXZlIGEgCmNsZWFyIHNldCBvZiBzZW1hbnRpY3MgdGhlaXIgb3duLiBC
dXQgZ3JvdXBpbmcgbmV0d29yayBhbmQgc2NzaSBpbnRvIGEgCnNpbmdsZSBjbGFzcyBsb29rcyB3
cm9uZywgdGhhdCdzIHRoZSB3b3JrIG9mIGEgdmlydHVhbCBidXMuCgpUaGUgY2xhc3Mgc2hvdWxk
IGJlIGRvbmUgb24gdG9wIG9mIHZEUEEgZGV2aWNlIGluc3RlYWQgb2YgdkRQQSBkZXZpY2UgCml0
c2VsZjoKCi0gRm9yIGtlcm5lbCBkcml2ZXIsIG5ldGRldiwgYmxrIGRldiBjb3VsZCBiZSBkb25l
IG9uIHRvcAotIEZvciB1c2Vyc3BhY2UgZHJpdmVyLCB0aGUgY2xhc3MgY291bGQgYmUgZG9uZSBi
eSB0aGUgZHJpdmVycyBpbnNpZGUgVk0gCm9yIHVzZXJzcGFjZSAoZHBkaykKCgo+IFRoZSAnaHcg
ZHJpdmVyJyBwdWxscyBpbgo+IGZ1bmN0aW9ucyBmcm9tIHRoZSAnc3Vic3lzdGVtJyB1c2luZyBh
IGNvbWJpbmF0aW9uIG9mIGNhbGxiYWNrcyBhbmQKPiBsaWJyYXJ5LXN0eWxlIGNhbGxzIHNvIHRo
ZXJlIGlzIG5vIGNvZGUgZHVwbGljYXRpb24uCgoKVGhlIHBvaW50IGlzIHdlIHdhbnQgdkRQQSBk
ZXZpY2VzIHRvIGJlIHVzZWQgYnkgZGlmZmVyZW50IHN1YnN5c3RlbXMsIApub3Qgb25seSB2aG9z
dCwgYnV0IGFsc28gbmV0ZGV2LCBibGssIGNyeXB0byAoZXZlcnkgc3Vic3lzdGVtIHRoYXQgY2Fu
IAp1c2UgdmlydGlvIGRldmljZXMpLiBUaGF0J3Mgd2h5IHdlIGludHJvZHVjZSB2RFBBIGJ1cyBh
bmQgaW50cm9kdWNlIApkaWZmZXJlbnQgZHJpdmVycyBvbiB0b3AuCgoKPgo+IEFzIGEgc3Vic3lz
dGVtLCB2aG9zdCZ2ZHBhIHNob3VsZCBleHBlY3QgaXRzICdIVyBkcml2ZXInIHRvIGJpbmQgdG8K
PiBkZXZpY2VzIG9uIGJ1c3NlcywgZm9yIGluc3RhbmNlIEkgd291bGQgZXhwZWN0Ogo+Cj4gICAt
IEEgZnV0dXJlIFNGL0FESS8ndmlydHVhbCBidXMnIGFzIGEgY2hpbGQgb2YgbXVsdGktZnVuY3Rp
b25hbCBQQ0kgZGV2aWNlCj4gICAgIEV4YWN0bHkgaG93IHRoaXMgd29ya3MgaXMgc3RpbGwgdW5k
ZXIgYWN0aXZlIGRpc2N1c3Npb24gYW5kIGlzCj4gICAgIG9uZSBwbGFjZSB3aGVyZSBHcmVnIHNh
aWQgJ3VzZSBhIGJ1cycuCgoKVGhhdCdzIG9rIGJ1dCBpdCdzIHNvbWV0aGluZyB0aGF0IGlzIG5v
dCBkaXJlY3RseSByZWxhdGVkIHRvIHZEUEEgd2hpY2ggCmNhbiBiZSBpbXBsZW1lbnRlZCBieSBh
bnkga2luZHMgb2YgZGV2aWNlcy9idXNlczoKCnN0cnVjdCBYWFhfZGV2aWNlIHsKc3RydWN0IHZk
cGFfZGV2aWNlIHZkcGE7CnN0cnVjdCBhZGlfZGV2aWNlL3BjaV9kZXZpY2UgKmxvd2VyZGV2Owp9
Ci4uLgoKCj4gICAtIEFuIGV4aXN0aW5nIFBDSSwgcGxhdGZvcm0sIG9yIG90aGVyIGJ1cyBhbmQg
ZGV2aWNlLiBObyBuZWVkIGZvciBhbgo+ICAgICBleHRyYSBidXMgaGVyZSwgUENJIGlzIHRoZSBi
dXMuCgoKVGhlcmUncmUgc2V2ZXJhbCBleGFtcGxlcyB0aGF0IGEgYnVzIGlzIG5lZWRlZCBvbiB0
b3AuCgpBIGdvb2QgZXhhbXBsZSBpcyBNZWxsYW5veCBUbUZJRk8gZHJpdmVyIHdoaWNoIGlzIGEg
cGxhdGZvcm0gZGV2aWNlIApkcml2ZXIgYnV0IHJlZ2lzdGVyIGl0c2VsZiBhcyBhIHZpcnRpbyBk
ZXZpY2UgaW4gb3JkZXIgdG8gYmUgdXNlZCBieSAKdmlyaXRvLWNvbnNvbGUgZHJpdmVyIG9uIHRo
ZSB2aXJ0aW8gYnVzLgoKQnV0IGl0J3MgYSBwaXR5IHRoYXQgdGhlIGRldmljZSBjYW4gbm90IGJl
IHVzZWQgYnkgdXNlcnNwYWNlIGRyaXZlciBkdWUgCnRvIHRoZSBsaW1pdGF0aW9uIG9mIHZpcml0
byBidXMgd2hpY2ggaXMgZGVzaWduZWQgZm9yIGtlcm5lbCBkcml2ZXIuIApUaGF0J3Mgd2h5IHZE
UEEgYnVzIGlzIGludHJvZHVjZWQgd2hpY2ggYWJzdHJhY3QgdGhlIGNvbW1vbiByZXF1aXJlbWVu
dHMgCm9mIGJvdGgga2VybmVsIGFuZCB1c2Vyc3BhY2UgZHJpdmVycyB3aGljaCBhbGxvdyB0aGUg
YSBzaW5nbGUgSFcgZHJpdmVyIAp0byBiZSB1c2VkIGJ5IGtlcm5lbCBkcml2ZXJzIChhbmQgdGhl
IHN1YnN5c3RlbXMgb24gdG9wKSBhbmQgdXNlcnNwYWNlIApkcml2ZXJzLgoKCj4gICAtIE5vIGJ1
cywgaWUgZm9yIGEgc2ltdWxhdG9yIG9yIGJpbmRpbmcgdG8gYSBuZXRkZXYuIChleGlzdGluZyB2
aG9zdD8pCgoKTm90ZSwgc2ltdWxhdG9yIGNhbiBoYXZlIGl0cyBvd24gY2xhc3MgKHN5c2ZzIGV0
Yy4pLgoKCj4KPiBUaGV5IHBvaW50IGlzIHRoYXQgdGhlIEhXIGRyaXZlcidzIGpvYiBpcyB0byBh
ZGFwdCBmcm9tIHRoZSBidXMgbGV2ZWwKPiBpbnRlcmZhY2VzIChlZyByZWFkbC93cml0ZWwpIHRv
IHRoZSBzdWJzeXN0ZW0gbGV2ZWwgKGVnIHNvbWV0aGluZyBsaWtlCj4gdGhlIHZkcGFfb3BzKS4K
Pgo+IEZvciBpbnN0YW5jZSB0aGF0IEludGVsIGRyaXZlciBzaG91bGQgYmUgYSBwY2lfZHJpdmVy
IHRvIGJpbmQgdG8gYQo+IHN0cnVjdCBwY2lfZGV2aWNlIGZvciBpdHMgVkYgYW5kIHRoZW4gY2Fs
bCBzb21lICd2aG9zdCZ2ZHBhJwo+IF9yZWdpc3RlcigpIGZ1bmN0aW9uIHRvIHBhc3MgaXRzIG9w
cyB0byB0aGUgc3Vic3lzdGVtIHdoaWNoIGluIHR1cm4KPiBjcmVhdGVzIHRoZSBzdHJ1Y3QgZGV2
aWNlIG9mIHRoZSBzdWJzeXN0ZW0gY2FsbHMsIGNvbW1vbiBjaGFyIGRldmljZXMsCj4gc3lzZnMs
IGV0YyBhbmQgY2FsbHMgdGhlIGRyaXZlcidzIG9wcyBpbiByZXNwb25zZSB0byB1QVBJIGNhbGxz
Lgo+Cj4gVGhpcyBpcyBhbHJlYWR5IGFsbW9zdCBob3cgdGhpbmdzIHdlcmUgc2V0dXAgaW4gdjIg
b2YgdGhlIHBhdGNoZXMsCj4gbmVhciBhcyBJIGNhbiBzZWUsIGp1c3QgdGhhdCBhIGJ1cyB3YXMg
aW5zZXJ0ZWQgc29tZWhvdyBpbnN0ZWFkIG9mCj4gaGF2aW5nIG9ubHkgdGhlIHZob3N0IGNsYXNz
LgoKCldlbGwgdGhlIHNlcmllcyAocGx1cyBtZGV2IHBhcnQpIHVzZXMgYSBidXMgc2luY2UgZGF5
IDAuIEl0J3Mgbm90IApzb21ldGhpbmcgbmV3LgoKVGhhbmtzCgoKPiAgIFNvIGl0IGl3YXMgY29u
ZnVzaW5nIGFuZCB0aGUgbGlmZXRpbWUKPiBtb2RlbCBiZWNvbWVzIHRvbyBjb21wbGljYXRlZCB0
byBpbXBsZW1lbnQgY29ycmVjdGx5Li4uCj4KPiBKYXNvbgo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
