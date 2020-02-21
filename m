Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCDC16718B
	for <lists.virtualization@lfdr.de>; Fri, 21 Feb 2020 08:55:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 428EE87EAD;
	Fri, 21 Feb 2020 07:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1HPAEYp-qri; Fri, 21 Feb 2020 07:55:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A20C687EA9;
	Fri, 21 Feb 2020 07:55:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81C53C1D85;
	Fri, 21 Feb 2020 07:55:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF187C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 07:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9999E861FE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 07:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Z1xfYggu7rT
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 07:55:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C8EC9861AA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 07:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582271727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVCnnoi6wVTChFDkUlf2zuvKVv3+WsxMSBarJbh7sxI=;
 b=ACA+k2OiTH8KIyt4Q837ZDWKTZkmzUHX+vUJhELwd8GJ7AtXORDzMxl7H5OWKg++D2Vq5+
 fQTJGCPox61PRBcfxl7GrjhlMFGj2b0pqSYvEnJTW0AR56J171lpG6PSfHwj45Z7auELgz
 PtwbOT6qrzH+0h6oYKIOrTMEUCceIFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-72rAjlVNP2aS6JJL5_kEjQ-1; Fri, 21 Feb 2020 02:55:25 -0500
X-MC-Unique: 72rAjlVNP2aS6JJL5_kEjQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8955DB60;
 Fri, 21 Feb 2020 07:55:22 +0000 (UTC)
Received: from [10.72.13.208] (ovpn-13-208.pek2.redhat.com [10.72.13.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 433D99076C;
 Fri, 21 Feb 2020 07:54:52 +0000 (UTC)
Subject: Re: [PATCH V4 3/5] vDPA: introduce vDPA bus
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200220061141.29390-1-jasowang@redhat.com>
 <20200220061141.29390-4-jasowang@redhat.com>
 <20200220151412.GV23930@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5d7de10a-dcce-7aa7-c033-2394718aa56b@redhat.com>
Date: Fri, 21 Feb 2020 15:54:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200220151412.GV23930@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
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

Ck9uIDIwMjAvMi8yMCDkuIvljYgxMToxNCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFRo
dSwgRmViIDIwLCAyMDIwIGF0IDAyOjExOjM5UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
IHZEUEEgZGV2aWNlIGlzIGEgZGV2aWNlIHRoYXQgdXNlcyBhIGRhdGFwYXRoIHdoaWNoIGNvbXBs
aWVzIHdpdGggdGhlCj4+IHZpcnRpbyBzcGVjaWZpY2F0aW9ucyB3aXRoIHZlbmRvciBzcGVjaWZp
YyBjb250cm9sIHBhdGguIHZEUEEgZGV2aWNlcwo+PiBjYW4gYmUgYm90aCBwaHlzaWNhbGx5IGxv
Y2F0ZWQgb24gdGhlIGhhcmR3YXJlIG9yIGVtdWxhdGVkIGJ5Cj4+IHNvZnR3YXJlLiB2RFBBIGhh
cmR3YXJlIGRldmljZXMgYXJlIHVzdWFsbHkgaW1wbGVtZW50ZWQgdGhyb3VnaCBQQ0lFCj4+IHdp
dGggdGhlIGZvbGxvd2luZyB0eXBlczoKPj4KPj4gLSBQRiAoUGh5c2ljYWwgRnVuY3Rpb24pIC0g
QSBzaW5nbGUgUGh5c2ljYWwgRnVuY3Rpb24KPj4gLSBWRiAoVmlydHVhbCBGdW5jdGlvbikgLSBE
ZXZpY2UgdGhhdCBzdXBwb3J0cyBzaW5nbGUgcm9vdCBJL08KPj4gICAgdmlydHVhbGl6YXRpb24g
KFNSLUlPVikuIEl0cyBWaXJ0dWFsIEZ1bmN0aW9uIChWRikgcmVwcmVzZW50cyBhCj4+ICAgIHZp
cnR1YWxpemVkIGluc3RhbmNlIG9mIHRoZSBkZXZpY2UgdGhhdCBjYW4gYmUgYXNzaWduZWQgdG8g
ZGlmZmVyZW50Cj4+ICAgIHBhcnRpdGlvbnMKPj4gLSBBREkgKEFzc2lnbmFibGUgRGV2aWNlIElu
dGVyZmFjZSkgYW5kIGl0cyBlcXVpdmFsZW50cyAtIFdpdGgKPj4gICAgdGVjaG5vbG9naWVzIHN1
Y2ggYXMgSW50ZWwgU2NhbGFibGUgSU9WLCBhIHZpcnR1YWwgZGV2aWNlIChWREVWKQo+PiAgICBj
b21wb3NlZCBieSBob3N0IE9TIHV0aWxpemluZyBvbmUgb3IgbW9yZSBBRElzLiBPciBpdHMgZXF1
aXZhbGVudAo+PiAgICBsaWtlIFNGIChTdWIgZnVuY3Rpb24pIGZyb20gTWVsbGFub3guCj4+Cj4+
ICBGcm9tIGEgZHJpdmVyJ3MgcGVyc3BlY3RpdmUsIGRlcGVuZHMgb24gaG93IGFuZCB3aGVyZSB0
aGUgRE1BCj4+IHRyYW5zbGF0aW9uIGlzIGRvbmUsIHZEUEEgZGV2aWNlcyBhcmUgc3BsaXQgaW50
byB0d28gdHlwZXM6Cj4+Cj4+IC0gUGxhdGZvcm0gc3BlY2lmaWMgRE1BIHRyYW5zbGF0aW9uIC0g
RnJvbSB0aGUgZHJpdmVyJ3MgcGVyc3BlY3RpdmUsCj4+ICAgIHRoZSBkZXZpY2UgY2FuIGJlIHVz
ZWQgb24gYSBwbGF0Zm9ybSB3aGVyZSBkZXZpY2UgYWNjZXNzIHRvIGRhdGEgaW4KPj4gICAgbWVt
b3J5IGlzIGxpbWl0ZWQgYW5kL29yIHRyYW5zbGF0ZWQuIEFuIGV4YW1wbGUgaXMgYSBQQ0lFIHZE
UEEgd2hvc2UKPj4gICAgRE1BIHJlcXVlc3Qgd2FzIHRhZ2dlZCB2aWEgYSBidXMgKGUuZyBQQ0lF
KSBzcGVjaWZpYyB3YXkuIERNQQo+PiAgICB0cmFuc2xhdGlvbiBhbmQgcHJvdGVjdGlvbiBhcmUg
ZG9uZSBhdCBQQ0lFIGJ1cyBJT01NVSBsZXZlbC4KPj4gLSBEZXZpY2Ugc3BlY2lmaWMgRE1BIHRy
YW5zbGF0aW9uIC0gVGhlIGRldmljZSBpbXBsZW1lbnRzIERNQQo+PiAgICBpc29sYXRpb24gYW5k
IHByb3RlY3Rpb24gdGhyb3VnaCBpdHMgb3duIGxvZ2ljLiBBbiBleGFtcGxlIGlzIGEgdkRQQQo+
PiAgICBkZXZpY2Ugd2hpY2ggdXNlcyBvbi1jaGlwIElPTU1VLgo+Pgo+PiBUbyBoaWRlIHRoZSBk
aWZmZXJlbmNlcyBhbmQgY29tcGxleGl0eSBvZiB0aGUgYWJvdmUgdHlwZXMgZm9yIGEgdkRQQQo+
PiBkZXZpY2UvSU9NTVUgb3B0aW9ucyBhbmQgaW4gb3JkZXIgdG8gcHJlc2VudCBhIGdlbmVyaWMg
dmlydGlvIGRldmljZQo+PiB0byB0aGUgdXBwZXIgbGF5ZXIsIGEgZGV2aWNlIGFnbm9zdGljIGZy
YW1ld29yayBpcyByZXF1aXJlZC4KPj4KPj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgc29mdHdh
cmUgdkRQQSBidXMgd2hpY2ggYWJzdHJhY3RzIHRoZQo+PiBjb21tb24gYXR0cmlidXRlcyBvZiB2
RFBBIGRldmljZSwgdkRQQSBidXMgZHJpdmVyIGFuZCB0aGUKPj4gY29tbXVuaWNhdGlvbiBtZXRo
b2QgKHZkcGFfY29uZmlnX29wcykgYmV0d2VlbiB0aGUgdkRQQSBkZXZpY2UKPj4gYWJzdHJhY3Rp
b24gYW5kIHRoZSB2RFBBIGJ1cyBkcml2ZXIuIFRoaXMgYWxsb3dzIG11bHRpcGxlIHR5cGVzIG9m
Cj4+IGRyaXZlcnMgdG8gYmUgdXNlZCBmb3IgdkRQQSBkZXZpY2UgbGlrZSB0aGUgdmlydGlvX3Zk
cGEgYW5kIHZob3N0X3ZkcGEKPj4gZHJpdmVyIHRvIG9wZXJhdGUgb24gdGhlIGJ1cyBhbmQgYWxs
b3cgdkRQQSBkZXZpY2UgY291bGQgYmUgdXNlZCBieQo+PiBlaXRoZXIga2VybmVsIHZpcnRpbyBk
cml2ZXIgb3IgdXNlcnNwYWNlIHZob3N0IGRyaXZlcnMgYXM6Cj4+Cj4+ICAgICB2aXJ0aW8gZHJp
dmVycyAgdmhvc3QgZHJpdmVycwo+PiAgICAgICAgICAgIHwgICAgICAgICAgICAgfAo+PiAgICAg
IFt2aXJ0aW8gYnVzXSAgIFt2aG9zdCB1QVBJXQo+PiAgICAgICAgICAgIHwgICAgICAgICAgICAg
fAo+PiAgICAgdmlydGlvIGRldmljZSAgIHZob3N0IGRldmljZQo+PiAgICAgdmlydGlvX3ZkcGEg
ZHJ2IHZob3N0X3ZkcGEgZHJ2Cj4+ICAgICAgICAgICAgICAgXCAgICAgICAvCj4+ICAgICAgICAg
ICAgICBbdkRQQSBidXNdCj4+ICAgICAgICAgICAgICAgICAgIHwKPj4gICAgICAgICAgICAgIHZE
UEEgZGV2aWNlCj4+ICAgICAgICAgICAgICBoYXJkd2FyZSBkcnYKPj4gICAgICAgICAgICAgICAg
ICAgfAo+PiAgICAgICAgICAgICAgW2hhcmR3YXJlIGJ1c10KPj4gICAgICAgICAgICAgICAgICAg
fAo+PiAgICAgICAgICAgICAgdkRQQSBoYXJkd2FyZQo+IEkgc3RpbGwgZG9uJ3QgbGlrZSB0aGlz
IHN0cmFuZ2UgY29tcGxleGl0eSwgdmhvc3Qgc2hvdWxkIGhhdmUgYmVlbgo+IGxheWVyZWQgb24g
dG9wIG9mIHRoZSB2aXJ0aW8gZGV2aWNlIGluc3RlYWQgb2YgYWRkaW5nIGFuIGV4dHJhIGJ1cwo+
IGp1c3QgZm9yIHZkcGEuCgoKV2UndmUgY29uc2lkZXJlZCBzdWNoIG1ldGhvZCBhbmQgSSB0aGlu
ayB3aHkgd2UgY2hvb3NlIGEgYnVzIGlzOgoKLSB2RFBBIGRldmljZSB3YXMgb3JpZ2luYWxseSBu
YW1lZCBhcyAidmhvc3QgRGF0YXBhdGggQWNjZWxlcmF0aW9uIiAKd2hpY2ggbWVhbnMgdGhlIGRh
dGFwYXRoIGNvbXBsaWVzIHZpcnRpbyBzcGVjaWZpY2F0aW9uIGJ1dCBub3QgY29udHJvbCAKcGF0
aC4gVGhpcyBtZWFucyB0aGUgZGV2aWNlIHNob3VsZCBiZWhhdmUgbGlrZSB2aG9zdC4gQW5kIGlu
IG9yZGVyIHRvIApzdXBwb3J0IHZob3N0LCB2RFBBIGRldmljZSByZXF1aXJlcyBtb3JlIGZ1bmN0
aW9uIHRoYW4gdmlydGlvLiBFLmcgdGhlIAphYmlsaXR5IHRvIHF1ZXJ5IHRoZSBkZXZpY2Ugc3Rh
dGUgKHZpcnRxdWV1ZSBpbmRpY2VzLCBjb3VudGVycyBldGMpIGFuZCAKdHJhY2sgZGlydHkgcGFn
ZXMuIFRoaXMgbWVhbiBldmVuIGEgcHVyZSB2aXJ0aW8gaGFyZHdhcmUgbWF5IG5vdCB3b3JrIApm
b3Igdmhvc3QuIFRoYXQncyB3aHkgYSBtdWx0aSBpbmhlcml0YW5jZSBpcyB1c2VkIGZvciBhIG5l
dyB0eXBlIG9mIHZEUEEgCmRldmljZS4KCi0gQXMgd2UndmUgYWxyZWFkeSBkaXNjdXNzZWQsIHZp
cnRpbyBidXMgaXMgZGVzaWduZWQgZm9yIGtlcm5lbCBkcml2ZXIgCmFuZCBhIGJydW5jaGVzIG9m
IGRldmljZXMsIGRyaXZlcnMgb3IgZXZlbiBidXNlcyBoYXZlIGJlZW4gaW1wbGVtZW50ZWQgCmFy
b3VuZCB0aGF0LiBJdCByZXF1aXJlcyBhIG1ham9yIHJlZmFjdG9yaW5nIG5vdCBvbmx5IHdpdGgg
dGhlIHZpcnRpbyAKYnVzIGJ1dCBhbHNvIHdpdGggdGhlIGRyaXZlcnMgYW5kIGRldmljZXMgdG8g
bWFrZSBpdCBiZWhhdmUgbW9yZSBsaWtlIGEgCnZob3N0LiBBYnN0cmFjdCB2RFBBIGFzIGEga2lu
ZCBvZiB0cmFuc3BvcnQgZm9yIHZpcnRpbyBncmVhdGx5IHNpbXBsaWZ5IAp0aGUgd29yayBhbmQg
aGF2ZSBhbG1vc3QgemVybyBpbXBhY3Qgb24gdGhlIGV4aXN0IHZpcnRpbyBjb3JlLiBWT1AgCih2
b3BfYnVzKSB1c2Ugc2ltaWxhciBkZXNpZ24uCgoKPgo+IEhvd2V2ZXIsIEkgZG9uJ3Qgc2VlIGFu
eSB0ZWNobmljYWwgcHJvYmxlbXMgd2l0aCB0aGlzIHBhdGNoIG5vdy4KCgpUaGFua3MsIHlvdXIg
cmV2aWV3IGlzIGdyZWF0bHkgYXBwcmVjaWF0ZWQuCgoKPgo+IFRoYW5rcywKPiBKYXNvbgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
