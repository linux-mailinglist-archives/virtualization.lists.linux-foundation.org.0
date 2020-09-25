Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9804F278607
	for <lists.virtualization@lfdr.de>; Fri, 25 Sep 2020 13:37:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 716452E16B;
	Fri, 25 Sep 2020 11:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xSD3F8UMzpT6; Fri, 25 Sep 2020 11:36:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A2D5E2E16C;
	Fri, 25 Sep 2020 11:36:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E35BC0051;
	Fri, 25 Sep 2020 11:36:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F526C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 11:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 47C0186CB8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 11:36:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XC4tXb3JZvLg
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 11:36:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E332C86CB2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 11:36:52 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601033811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/In/MyFjECzpjg2964FDjcYSNLEaaOd6O2cQZuUIz4w=;
 b=KFWfXdweSnYAmAAb1lk+OkItM8dR4zlHXG0GXSsg+4yS3RGJbxzFo++XnW2Zw5h0H5V6qH
 WITDKm9c5ZBfwDNWgnKmsEqsZust+gfnabIpF7yd54T6CW8fVp2ICJ3GEJUlmxcY8wiYuR
 tna9u504qzte930fNA6SdASCB3JF25Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-dIZtoN74OPeva-7u3bbOug-1; Fri, 25 Sep 2020 07:36:47 -0400
X-MC-Unique: dIZtoN74OPeva-7u3bbOug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0016C18BA283;
 Fri, 25 Sep 2020 11:36:46 +0000 (UTC)
Received: from [10.72.12.44] (ovpn-12-44.pek2.redhat.com [10.72.12.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A95078828;
 Fri, 25 Sep 2020 11:36:31 +0000 (UTC)
Subject: Re: [RFC PATCH 00/24] Control VQ support in vDPA
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20200924032125.18619-1-jasowang@redhat.com>
 <20200924101720.GR62770@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6825ecc1-ffc5-e980-c44e-c18c0a2eaa41@redhat.com>
Date: Fri, 25 Sep 2020 19:36:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924101720.GR62770@stefanha-x1.localdomain>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: lulu@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, mhabets@solarflare.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, eli@mellanox.com, maxime.coquelin@redhat.com,
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

Ck9uIDIwMjAvOS8yNCDkuIvljYg2OjE3LCBTdGVmYW4gSGFqbm9jemkgd3JvdGU6Cj4gT24gVGh1
LCBTZXAgMjQsIDIwMjAgYXQgMTE6MjE6MDFBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
VGhpcyBzZXJpZXMgdHJpZXMgdG8gYWRkIHRoZSBzdXBwb3J0IGZvciBjb250cm9sIHZpcnRxdWV1
ZSBpbiB2RFBBLgo+IFBsZWFzZSBpbmNsdWRlIGRvY3VtZW50YXRpb24gZm9yIGJvdGggZHJpdmVy
IGF1dGhvcnMgYW5kIHZob3N0LXZkcGEKPiBpb2N0bCB1c2Vycy4gdmhvc3QtdmRwYSBpb2N0bHMg
YXJlIG9ubHkgZG9jdW1lbnRlZCB3aXRoIGEgc2luZ2xlCj4gc2VudGVuY2UuIFBsZWFzZSBhZGQg
ZnVsbCBpbmZvcm1hdGlvbiBvbiBhcmd1bWVudHMsIHJldHVybiB2YWx1ZXMsIGFuZCBhCj4gaGln
aC1sZXZlbCBleHBsYW5hdGlvbiBvZiB0aGUgZmVhdHVyZSAobGlrZSB0aGlzIGNvdmVyIGxldHRl
cikgdG8KPiBpbnRyb2R1Y2UgdGhlIEFQSS4KCgpSaWdodCwgdGhpcyBpcyBpbiB0aGUgVE9ETyBs
aXN0LiAoQW5kIHdlIHByb2JhYmx5IG5lZWQgdG8gc3RhcnQgd2l0aCAKZG9jdW1lbnRpbmcgdkRQ
QSBidXMgb3BlcmF0aW9ucyBmaXJzdCkuCgoKPgo+IFdoYXQgaXMgdGhlIHBvbGljeSBmb3IgdXNp
bmcgdmlydHF1ZXVlIGdyb3Vwcz8gTXkgZ3Vlc3MgaXM6Cj4gMS4gdmlydGlvX3ZkcGEgc2ltcGx5
IGVuYWJsZXMgYWxsIHZpcnRxdWV1ZSBncm91cHMuCj4gMi4gdmhvc3RfdmRwYSByZWxpZXMgb24g
dXNlcnNwYWNlIHBvbGljeSBvbiBob3cgdG8gdXNlIHZpcnRxdWV1ZSBncm91cHMuCj4gICAgIEFy
ZSB0aGUgc2VtYW50aWNzIG9mIHZpcnRxdWV1ZSBncm91cHMgZG9jdW1lbnRlZCBzb21ld2hlcmUg
c28KPiAgICAgdXNlcnNwYWNlIGtub3dzIHdoYXQgdG8gZG8/IElmIGEgdkRQQSBkcml2ZXIgYXV0
aG9yIGRlY2lkZXMgdG8gY3JlYXRlCj4gICAgIE4gdmlydHF1ZXVlIGdyb3VwcywgTi8yIHZpcnRx
dWV1ZSBncm91cHMsIG9yIGp1c3QgMSB2aXJ0cXVldWUgZ3JvdXAsCj4gICAgIGhvdyB3aWxsIHVz
ZXJzcGFjZSBrbm93IHdoYXQgdG8gZG8/CgoKU28gdGhlIG1hcHBpbmcgZnJvbSB2aXJ0cXVldWUg
dG8gdmlydHF1ZXVlIGdyb3VwIGlzIG1hbmRhdGVkIGJ5IHRoZSB2RFBBIApkZXZpY2UoZHJpdmVy
KS4gdkRQQSBidXMgZHJpdmVyIChsaWtlIHZob3N0LXZEUEEpLCBjYW4gb25seSBjaGFuZ2UgdGhl
IAphc3NvY2lhdGlvbiBiZXR3ZWVuIHZpcnRxdWV1ZSBncm91cHMgYW5kIEFTSUQuCgpCeSBkZWZh
dWx0LCBpdCBpcyByZXF1aXJlZCBhbGwgdmlydHF1ZXVlIGdyb3VwcyB0byBiZSBhc3NvY2lhdGVk
IHRvIAphZGRyZXNzIHNwYWNlIDAuIFRoaXMgbWFrZSBzdXJlIHZpcnRpb192ZHBhIGNhbiB3b3Jr
IHdpdGhvdXQgYW55IHNwZWNpYWwgCmdyb3Vwcy9hc2lkIGNvbmZpZ3VyYXRpb24uCgpJIGFkbWl0
IHdlIG5lZWQgZG9jdW1lbnQgYWxsIHRob3NlIHNlbWFudGljcy9wb2xpY2VzLgoKCj4KPiBNYXli
ZSBhIGRvY3VtZW50IGlzIG5lZWRlZCB0byBkZXNjcmliZSB0aGUgcmVjb21tZW5kZWQgZGV2aWNl
LXNwZWNpZmljCj4gdmlydHF1ZXVlIGdyb3VwcyB0aGF0IHZEUEEgZHJpdmVycyBzaG91bGQgaW1w
bGVtZW50IChlLmcuICJwdXQgdGhlIG5ldAo+IGNvbnRyb2wgdnEgaW50byBpdHMgb3duIHZpcnRx
dWV1ZSBncm91cCIpPwoKClllcywgbm90ZSB0aGF0IHRoaXMgZGVwZW5kcyBvbiB0aGUgaGFyZHdh
cmUgY2FwYWJpbGl0eSBhY3R1YWxseS4gSXQgY2FuIApvbmx5IHB1dCBjb250cm9sIHZxIGluIG90
aGVyIHZpcnRxdWV1ZSBncm91cCBpZjoKCjEpIGhhcmR3YXJlIHN1cHBvcnQgdG8gaXNvbGF0ZSBj
b250cm9sIHZxIERNQSBmcm9tIHRoZSByZXN0IHZpcnRxdWV1ZXMgCihQQVNJRCBvciBzaW1wbHkg
dXNpbmcgUEEgKHRyYW5zbGF0ZWQgYWRkcmVzcykgZm9yIGNvbnRyb2wgdnEpCm9yCjIpIHRoZSBj
b250cm9sIHZxIGlzIGVtdWxhdGVkIGJ5IHZEUEEgZGV2aWNlIGRyaXZlciAobGlrZSB2ZHBhX3Np
bSBkaWQpLgoKCj4KPiBUaGlzIGNvdWxkIGJlY29tZSBtZXNzeSB3aXRoIGd1aWRlbGluZXMuIEZv
ciBleGFtcGxlLCBkcml2ZXJzIG1pZ2h0IGJlCj4gc2hpcHBlZCB0aGF0IGFyZW4ndCB1c2FibGUg
Zm9yIGNlcnRhaW4gdXNlIGNhc2VzIGp1c3QgYmVjYXVzZSB0aGUgYXV0aG9yCj4gZGlkbid0IGtu
b3cgdGhhdCBhIGNlcnRhaW4gdmlydHF1ZXVlIGdyb3VwaW5nIGlzIGFkdmFudGFnZW91cy4KCgpS
aWdodC4KCgo+Cj4gQlRXIEkgbGlrZSBob3cgZ2VuZXJhbCB0aGlzIGZlYXR1cmUgaXMuIEl0IHNl
ZW1zIHRvIGFsbG93IHZEUEEgZGV2aWNlcwo+IHRvIGJlIHNwbGl0IGludG8gc3ViLWRldmljZXMg
Zm9yIGZ1cnRoZXIgcGFzc3Rocm91Z2guIFdobyB3aWxsIHdyaXRlIHRoZQo+IGZpcnN0IHZEUEEt
b24tdkRQQSBkcml2ZXI/IDopCgoKWWVzLCB0aGF0J3MgYW4gaW50ZXJlc3RpbmcgcXVlc3Rpb24u
IEZvciBub3csIEkgY2FuIGltYWdpbmUgd2UgY2FuIAplbXVsYXRlZCBhIFNSSU9WIGJhc2VkIHZp
cnRpby1uZXQgVkZzIHZpYSB0aGlzLgoKSWYgd2Ugd2FudCB0byBleHBvc2UgdGhlIEFTSUQgc2V0
dGluZyB0byBndWVzdCBhcyB3ZWxsLCBpdCBwcm9iYWJseSAKbmVlZHMgbW9yZSB0aG91Z2h0LgoK
VGhhbmtzCgoKPgo+IFN0ZWZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
