Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0EF192254
	for <lists.virtualization@lfdr.de>; Wed, 25 Mar 2020 09:15:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 04F658810D;
	Wed, 25 Mar 2020 08:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UwvHOyTByGCj; Wed, 25 Mar 2020 08:15:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CED0F880C8;
	Wed, 25 Mar 2020 08:15:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA52EC1D89;
	Wed, 25 Mar 2020 08:15:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C808CC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 08:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BF9C186CA5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 08:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qz0sEZjJJlp4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 08:15:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 857E886C4D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 08:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585124139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hOKCgDt3MdkDi+eEQM/u9xHMiA/ynm2nLfPeOZVBaHM=;
 b=FI8rXs/SdkEBA1RvZn1zLuWj2/nBKqHDSxHGAezQ2s9Huh4Q1nwIAHx0JTjk7UlpP9WliA
 kSv6JjLJdFG3zQjQMJf8FjL+s9SYG27Nu6r4dQcagEB4MRuUV4oPgAnF3mYvDhNK4VF5JK
 3KVdEYQxGpw7mO8G1hx8Los+lZYS1Hw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-dnKYzcUZNe-hkbmv6mqokg-1; Wed, 25 Mar 2020 04:15:35 -0400
X-MC-Unique: dnKYzcUZNe-hkbmv6mqokg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFAB418B5F6A;
 Wed, 25 Mar 2020 08:15:33 +0000 (UTC)
Received: from [10.72.14.13] (ovpn-14-13.pek2.redhat.com [10.72.14.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41FE65DA7B;
 Wed, 25 Mar 2020 08:15:21 +0000 (UTC)
Subject: Re: [PATCH V7 7/8] vdpasim: vDPA device simulator
To: kbuild test robot <lkp@intel.com>
References: <20200324041458.27384-8-jasowang@redhat.com>
 <202003251045.ncVINn70%lkp@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <26bc89b3-8e29-db25-18fc-64e309951a94@redhat.com>
Date: Wed, 25 Mar 2020 16:15:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <202003251045.ncVINn70%lkp@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: kbuild-all@lists.01.org, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvMy8yNSDkuIrljYgxMDoyNSwga2J1aWxkIHRlc3Qgcm9ib3Qgd3JvdGU6Cj4gSSBs
b3ZlIHlvdXIgcGF0Y2ghIFlldCBzb21ldGhpbmcgdG8gaW1wcm92ZToKPgo+IFthdXRvIGJ1aWxk
IHRlc3QgRVJST1Igb24gdmhvc3QvbGludXgtbmV4dF0KPiBbYWxzbyBidWlsZCB0ZXN0IEVSUk9S
IG9uIGxpbnV4L21hc3RlciBsaW51cy9tYXN0ZXIgdjUuNi1yYzcgbmV4dC0yMDIwMDMyNF0KPiBb
aWYgeW91ciBwYXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwgcGxlYXNlIGRy
b3AgdXMgYSBub3RlIHRvIGhlbHAKPiBpbXByb3ZlIHRoZSBzeXN0ZW0uIEJUVywgd2UgYWxzbyBz
dWdnZXN0IHRvIHVzZSAnLS1iYXNlJyBvcHRpb24gdG8gc3BlY2lmeSB0aGUKPiBiYXNlIHRyZWUg
aW4gZ2l0IGZvcm1hdC1wYXRjaCwgcGxlYXNlIHNlZWh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20v
YS8zNzQwNjk4Ml0KPgo+IHVybDpodHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21t
aXRzL0phc29uLVdhbmcvdkRQQS1zdXBwb3J0LzIwMjAwMzI0LTE0MjYzNAo+IGJhc2U6aHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXN0L3Zob3N0LmdpdCAg
bGludXgtbmV4dAo+IGNvbmZpZzogbTY4ay1hbGx5ZXNjb25maWcgKGF0dGFjaGVkIGFzIC5jb25m
aWcpCj4gY29tcGlsZXI6IG02OGstbGludXgtZ2NjIChHQ0MpIDkuMi4wCj4gcmVwcm9kdWNlOgo+
ICAgICAgICAgIHdnZXRodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vaW50ZWwvbGtw
LXRlc3RzL21hc3Rlci9zYmluL21ha2UuY3Jvc3MgIC1PIH4vYmluL21ha2UuY3Jvc3MKPiAgICAg
ICAgICBjaG1vZCAreCB+L2Jpbi9tYWtlLmNyb3NzCj4gICAgICAgICAgIyBzYXZlIHRoZSBhdHRh
Y2hlZCAuY29uZmlnIHRvIGxpbnV4IGJ1aWxkIHRyZWUKPiAgICAgICAgICBHQ0NfVkVSU0lPTj05
LjIuMCBtYWtlLmNyb3NzIEFSQ0g9bTY4awo+Cj4gSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRs
eSBhZGQgZm9sbG93aW5nIHRhZwo+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdDxsa3BA
aW50ZWwuY29tPgo+Cj4gQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOgoKClRo
aXMgaXMgYmVjYXVzZSBWRFBBX1NJTSBzZWxlY3RzIFZIT1NUX1JJTkcgd2hpY2ggc2VsZWN0cyBW
SE9TVF9JT1RMQiAKd2hpY2ggZGVwZW5kcyBvbiBWSVJUVUxBSVpBVElPTiBidXQgbm90IGRlZmlu
ZWQgaW4gbTY4ay4KCkkgdGhpbmsgd2Ugc2hvdWxkIHJlZmluZSB0aGUgdmhvc3QgS2NvbmZpZyBh
bmQgZGVjb3VwbGUgaXQgb3V0IG9mIApWSVJUVUFMSVpBVElPTi4KCldpbGwgc2VuZCBhIG5ldyBz
ZXJpZXMgd2l0aCB0aGlzIHNob3J0bHkuCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
