Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 847CA34D2CF
	for <lists.virtualization@lfdr.de>; Mon, 29 Mar 2021 16:50:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9F5E402F0;
	Mon, 29 Mar 2021 14:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NhaedpwhfTf; Mon, 29 Mar 2021 14:50:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E8ED402F9;
	Mon, 29 Mar 2021 14:50:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7CCBC000A;
	Mon, 29 Mar 2021 14:50:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2856DC000A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Mar 2021 14:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 168484011F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Mar 2021 14:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bp3sug9hgAnI
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Mar 2021 14:50:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E6CA400A8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Mar 2021 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617029443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AiC+73Xs4kSPoXvyfbuMiaEleRXZLrDOv2WyG7IJ9lE=;
 b=Ek/CnJ8c7XeYXbP8gg5GDeNu8ScwTHf1EYiM1jNOQFFqs9eiDw/nmwQd5jjz77uUS3hBDr
 vUEqmS7TZ0kZczAYXncZpHsCEFIdbiN1hFNlWs2XbNENasnPFuDo3jyL/He21lyucbUETE
 g8OslrDJHbjybwFHRN/Kq4peur2oupM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-QzkjLy4_OliMtVGaiywOuQ-1; Mon, 29 Mar 2021 10:50:41 -0400
X-MC-Unique: QzkjLy4_OliMtVGaiywOuQ-1
Received: by mail-ed1-f70.google.com with SMTP id i6so8755675edq.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Mar 2021 07:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AiC+73Xs4kSPoXvyfbuMiaEleRXZLrDOv2WyG7IJ9lE=;
 b=GUaDBsPabFyddr60j/MZL7U4AWq2i3SETe/gWpzMNhi1Y/gqfMhmzuP0/C1m7oWgnX
 klUrEP2Mxj5WgpXTa4JZAkxs9/eT1hs5RxEbiWAoL4qO9vJCZjO4DirU1PK8mHSOmBQ6
 WGHa23uE7GJap3DRT4BMckfzeOVFKWtKya1F+GHUXRYqYaa2Y7c+WeNGAH8CqTXfxPpT
 CoZ5zcQ34r4TxDvlj35xbJxvz9xlGe7+ZkJF/7jcsi+YfRr+HjhulWCoRdOPkLC8nFa5
 cZhPMEiGnC2pFRnW4oFE8yvnFaF3pR9JllOZ8uOKdBoO3E6lEIJuYArFpNmfENCgFo6z
 Vv4A==
X-Gm-Message-State: AOAM531bVOiMzbGwHU1ji4TRoxqoVT4wJIVXE5h0giftsUyLOxsmvLBG
 zYDvsvzRVK66VlQPhIIIJFn2HpngbiKigTCI7Db0AIetrF+ZY8CuRMDPnwU96C4E9IUk3CYWkcZ
 Y3aT1MFy5o/p5SzchN0oxkFu+wrWfdILkoK3NUX8kbqu7SnBRr7dtilqOCklP8YxRH2qiUo7wLv
 /P0l6uRTJYCQ4cyXoWBA==
X-Received: by 2002:a05:6402:1d19:: with SMTP id
 dg25mr29087228edb.218.1617029439530; 
 Mon, 29 Mar 2021 07:50:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ0h33FKXM7RKArNHCxGPNpofryig56VM4BcXrDyS5PGplH7kogBrwukYo2tE1C76d3ZS+CQ==
X-Received: by 2002:a05:6402:1d19:: with SMTP id
 dg25mr29087198edb.218.1617029439193; 
 Mon, 29 Mar 2021 07:50:39 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id n25sm9179634edq.55.2021.03.29.07.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 07:50:38 -0700 (PDT)
Subject: Re: [PATCH v2 00/10] drm: Support simple-framebuffer devices and
 firmware fbs
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com, broonie@kernel.org,
 sam@ravnborg.org, robh@kernel.org, emil.l.velikov@gmail.com,
 geert+renesas@glider.be, bluescreen_avenger@verizon.net
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <d0ac63b3-dec5-58dc-2ce6-13cdef0399aa@redhat.com>
 <c88e9322-4bf1-e303-c1f1-b2b433aa439f@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a85f936f-cd4c-ab0d-ed68-9e95bb93acb8@redhat.com>
Date: Mon, 29 Mar 2021 16:50:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c88e9322-4bf1-e303-c1f1-b2b433aa439f@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

SGksCgpPbiAzLzI5LzIxIDI6MzEgUE0sIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+IEhpCj4g
Cj4gQW0gMjUuMDMuMjEgdW0gMTI6Mjkgc2NocmllYiBIYW5zIGRlIEdvZWRlOgo+PiBIaSwKPj4K
Pj4gT24gMy8xOC8yMSAxMToyOSBBTSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4+PiBUaGlz
IHBhdGNoc2V0IGFkZHMgc3VwcG9ydCBmb3Igc2ltcGxlLWZyYW1lYnVmZmVyIHBsYXRmb3JtIGRl
dmljZXMgYW5kCj4+PiBhIGhhbmRvdmVyIG1lY2hhbmlzbSBmb3IgbmF0aXZlIGRyaXZlcnMgdG8g
dGFrZS1vdmVyIGNvbnRyb2wgb2YgdGhlCj4+PiBoYXJkd2FyZS4KPj4+Cj4+PiBUaGUgbmV3IGRy
aXZlciwgY2FsbGVkIHNpbXBsZWRybSwgYmluZHMgdG8gYSBzaW1wbGUtZnJhbWJ1ZmZlciBwbGF0
Zm9ybQo+Pj4gZGV2aWNlLiBUaGUga2VybmVsJ3MgYm9vdCBjb2RlIGNyZWF0ZXMgc3VjaCBkZXZp
Y2VzIGZvciBmaXJtd2FyZS1wcm92aWRlZAo+Pj4gZnJhbWVidWZmZXJzLCBzdWNoIGFzIEVGSS1H
T1Agb3IgVkVTQS4gVHlwaWNhbGx5IHRoZSBCSU9TLCBVRUZJIG9yIGJvb3QKPj4+IGxvYWRlciBz
ZXRzIHVwIHRoZSBmcmFtZWJ1ZmZlcnMuIERlc2NyaXB0aW9uIHZpYSBkZXZpY2UgdHJlZSBpcyBh
bHNvIGFuCj4+PiBvcHRpb24uCj4+Pgo+Pj4gU2ltcGxlZHJtIGlzIHNtYWxsIGVub3VnaCB0byBi
ZSBsaW5rZWQgaW50byB0aGUga2VybmVsLiBUaGUgZHJpdmVyJ3MgbWFpbgo+Pj4gcHVycG9zZSBp
cyB0byBwcm92aWRlIGdyYXBoaWNhbCBvdXRwdXQgZHVyaW5nIHRoZSBlYXJseSBwaGFzZXMgb2Yg
dGhlIGJvb3QKPj4+IHByb2Nlc3MsIGJlZm9yZSB0aGUgbmF0aXZlIERSTSBkcml2ZXJzIGFyZSBh
dmFpbGFibGUuIE5hdGl2ZSBkcml2ZXJzIGFyZQo+Pj4gdHlwaWNhbGx5IGxvYWRlZCBmcm9tIGFu
IGluaXRyZCByYW0gZGlzay4gT2NjYXRpb25hbGx5IHNpbXBsZWRybSBjYW4gYWxzbwo+Pj4gc2Vy
dmUgYXMgaW50ZXJpbSBzb2x1dGlvbiBvbiBncmFwaGljcyBoYXJkd2FyZSB3aXRob3V0IG5hdGl2
ZSBEUk0gZHJpdmVyLgo+Pj4KPj4+IFNvIGZhciBkaXN0cmlidXRpb25zIHJlbHkgb24gZmJkZXYg
ZHJpdmVycywgc3VjaCBhcyBlZmlmYiwgdmVzYWZiIG9yCj4+PiBzaW1wbGVmYiwgZm9yIGVhcmx5
LWJvb3QgZ3JhcGhpY2FsIG91dHB1dC4gSG93ZXZlciBmYmRldiBpcyBkZXByZWNhdGVkIGFuZAo+
Pj4gdGhlIGRyaXZlcnMgZG8gbm90IHByb3ZpZGUgRFJNIGludGVyZmFjZXMgZm9yIG1vZGVybiB1
c2Vyc3BhY2UuCj4+Pgo+Pj4gUGF0Y2hlcyAxIGFuZCAyIHByZXBhcmUgdGhlIERSTSBmb3JtYXQg
aGVscGVycyBmb3Igc2ltcGxlZHJtLgo+Pj4KPj4+IFBhdGNoZXMgMyBhbmQgNCBhZGQgYSBoYW5k
LW92ZXIgbWVjaGFuaXNtLiBTaW1wbGVkcm0gYWNxdWlyZXMgaXQncwo+Pj4gZnJhbWVidWZmZXIn
cyBJL08tbWVtb3J5IHJhbmdlIGFuZCBwcm92aWRlcyBhIGNhbGxiYWNrIGZ1bmN0aW9uIHRvIGJl
Cj4+PiByZW1vdmVkIGJ5IGEgbmF0aXZlIGRyaXZlci4gVGhlIG5hdGl2ZSBkcml2ZXIgd2lsbCBy
ZW1vdmUgc2ltcGxlZHJtIGJlZm9yZQo+Pj4gdGFraW5nIG92ZXIgdGhlIGhhcmR3YXJlLiBUaGUg
cmVtb3ZhbCBpcyBpbnRlZ3JhdGVkIGludG8gZXhpc3RpbmcgaGVscGVycywKPj4+IHNvIGRyaXZl
cnMgdXNlIGl0IGF1dG9tYXRpY2FsbHkuCj4+Pgo+Pj4gUGF0Y2hlcyA1IHRvIDEwIGFkZCB0aGUg
c2ltcGxlZHJtIGRyaXZlci4gSXQncyBidWlsZCBvbiBzaW1wbGUgRFJNIGhlbHBlcnMKPj4+IGFu
ZCBTSE1FTS4gSXQgc3VwcG9ydHMgMTYtYml0LCAyNC1iaXQgYW5kIDMyLWJpdCBSR0IgZnJhbWVi
dWZmZXJzLiBEdXJpbmcKPj4+IHBhZ2VmbGlwcywgU0hNRU0gYnVmZmVycyBhcmUgY29waWVkIGlu
dG8gdGhlIGZyYW1lYnVmZmVyIG1lbW9yeSwgc2ltaWxhcgo+Pj4gdG8gY2lycnVzIG9yIG1nYWcy
MDAuIFRoZSBjb2RlIGluIHBhdGNoZXMgOCBhbmQgOSBoYW5kbGVzIGNsb2NrcyBhbmQKPj4+IHJl
Z3VsYXRvcnMuIEl0J3MgYmFzZWQgb24gdGhlIHNpbXBsZWZiIGRyaXZlcnMsIGJ1dCBoYXMgYmVl
biBtb2RpZmllZCBmb3IKPj4+IERSTS4KPj4KPj4gVGhhbmsgeW91IGZvciB5b3VyIHdvcmsgb24g
dGhpcywgdGhpcyBpcyB2ZXJ5IGludGVyZXN0aW5nLgo+Pgo+Pj4gSSd2ZSBhbHNvIGJlZW4gd29y
a2luZyBvbiBmYXN0Ym9vdCBzdXBwb3J0IChpLmUuLCBmbGlja2VyLWZyZWUgYm9vdGluZykuCj4+
PiBUaGlzIHJlcXVpcmVzIHN0YXRlLXJlYWRvdXQgZnJvbSBzaW1wbGVkcm0gdmlhIGdlbmVyaWMg
aW50ZXJmYWNlcywgYXMKPj4+IG91dGxpbmVkIGluIFsxXS4gSSBkbyBoYXZlIHNvbWUgcHJvdG90
eXBlIGNvZGUsIGJ1dCBpdCB3aWxsIHRha2UgYSB3aGlsZQo+Pj4gdG8gZ2V0IHRoaXMgcmVhZHku
IFNpbXBsZWRybSB3aWxsIHRoZW4gc3VwcG9ydCBpdC4KPj4+Cj4+PiBJJ3ZlIHRlc3RlZCBzaW1w
bGVkcm0gd2l0aCB4ODYgRUZJIGFuZCBWRVNBIGZyYW1lYnVmZmVycywgd2hpY2ggYm90aCB3b3Jr
Cj4+PiByZWxpYWJseS4gVGhlIGZiZGV2IGNvbnNvbGUgYW5kIFdlc3RvbiB3b3JrIGF1dG9tYXRp
Y2FsbHkuIFhvcmcgcmVxdWlyZXMKPj4+IG1hbnVhbCBjb25maWd1cmF0aW9uIG9mIHRoZSBkZXZp
Y2UuIFhvcmdzIGN1cnJlbnQgbW9kZXNldHRpbmcgZHJpdmVyIGRvZXMKPj4+IG5vdCB3b3JrIHdp
dGggYm90aCwgcGxhdGZvcm0gYW5kIFBDSSBkZXZpY2UsIGZvciB0aGUgc2FtZSBwaHlzaWNhbAo+
Pj4gaGFyZHdhcmUuIE9uY2UgY29uZmlndXJlZCwgWDExIHdvcmtzLiBJIGxvb2tlZCBpbnRvIFgx
MSwgYnV0IGNvdWxkbid0IHNlZQo+Pj4gYW4gZWFzeSB3YXkgb2YgZml4aW5nIHRoZSBwcm9ibGVt
LiBXaXRoIHRoZSBwdXNoIHRvd2FyZHMgV2F5bGFuZCtYd2F5bGFuZAo+Pj4gSSBleHBlY3QgdGhl
IHByb2JsZW0gdG8gYmVjb21lIGEgbm9uLWlzc3VlIHNvb24uIEFkZGl0aW9uYWwgdGVzdGluZyBo
YXMKPj4+IGJlZW4gcmVwb3J0ZWQgYXQgWzJdLgo+Pj4KPj4+IE9uZSBjb3NtZXRpY2FsIGlzc3Vl
IGlzIHRoYXQgc2ltcGxlZHJtJ3MgZGV2aWNlIGZpbGUgaXMgY2FyZDAgYW5kIHRoZQo+Pj4gbmF0
aXZlIGRyaXZlcidzIGRldmljZSBmaWxlIGlzIGNhcmQxLiBBZnRlciBzaW1wbGVkcm0gaGFzIGJl
ZW4ga2lja2VkIG91dCwKPj4+IG9ubHkgY2FyZDEgaXMgbGVmdC4gVGhpcyBkb2VzIG5vdCBzZWVt
IHRvIGJlIGEgcHJhY3RpY2FsIHByb2JsZW0gaG93ZXZlci4KPj4+Cj4+PiBUT0RPL0lERUFTOgo+
Pj4KPj4+IMKgwqDCoMKgKiBwcm92aWRlIGRlZmVycmVkIHRha2VvdmVyCj4+Cj4+IEknbSBub3Qg
c3VyZSB3aGF0IHlvdSBtZWFuIHdpdGggdGhpcyA/wqAgQ3VycmVudGx5IGRlZmVycmVkLXRha2Vv
dmVyIGlzCj4+IGhhbmRsZWQgaW4gdGhlIGZiY29uIGNvZGUuIEN1cnJlbnQgZmxpY2tlcmZyZWUg
Ym9vdCB3b3JrcyBsaWtlIHRoaXMKPj4gKGFzc3VtaW5nIGEgc2luZ2xlIExDRCBwYW5lbCBpbiBh
IGxhcHRvcCk6Cj4+Cj4+IDEuIEVGSS9HT1Agc2V0cyB1cCB0aGUgZnJhbWVidWZmZXIsIGRyYXdz
IGEgdmVuZG9yIGxvZ28KPj4gMi4gVGhlIGJvb3Rsb2FkZXIgcnVucyBpbiBzaWxlbnQgbW9kZSBh
bmQgZG9lcyBub3QgdG91Y2ggYW55dGhpbmcgZ2Z4IHJlbGF0ZWQKPj4gMy4ga2VybmVsIGJvb3Rz
LCB3aXRoIGEgbG9nbGV2ZWwgb2YgMyBzbyBvbmx5IENSSVQvRU1FUkcgbWVzc2FnZXMgYXJlIHNo
b3duCj4+IDIuIGVmaWZiIGxvYWRzOyBhbmQgdGVsbHMgZmJjb24gdGhhdCBhIGZyYW1lYnVmZmVy
IGlzIG5vdyBhdmFpbGFibGUgZm9yIGl0IHRvICJiaW5kIgo+PiDCoMKgwqAgdG8uIFNpbmNlIENP
TkZJR19GUkFNRUJVRkZFUl9DT05TT0xFX0RFRkVSUkVEX1RBS0VPVkVSPXkgZmJjb24gZGVmZXJz
IHRha2luZyBvdmVyCj4+IMKgwqDCoCB0aGUgY29uc29sZSBhbmQgbGVhdmVzIHRoZSBkdW1teS1j
b25zb2xlIGRyaXZlciBpbiBwbGFjZSAodW5sZXNzIHRoZXJlIGhhdmUgYWxyZWFkeQo+PiDCoMKg
wqAgYmVlbiBrZXJuZWwgbWVzc2FnZXMgbG9nZ2VkLCB3aGljaCB0aGVyZSBzaG91bGRuJ3QgYmVj
YXVzZSBsb2dsZXZlbD0zKQo+PiAzLiBpOTE1IGxvYWRzLCByZWFkcyBvdXQgdGhlIGh3IHN0YXRl
IGNvbXBhcmVzIHRoaXMgdG8gdGhlIHByZWZlcnJlZC1tb2RlIGZvciB0aGUKPj4gwqDCoMKgIHBh
bmVsIHdoaWNoIGl0IHdvdWxkIHNldCwgdGhleSBtYXRjaCwgbm90aGluZyBoYXBwZW5zLiBpOTE1
IHRha2VzIG93bmVyc2hpcAo+PiDCoMKgwqAgb2YgdGhlIHNjYW5vdXQtYnVmZmVyIHNldCB1cCBi
eSB0aGUgR09QLCBidXQgbGVhdmVzIGl0IGluIHBsYWNlLgo+PiDCoMKgwqAgaTkxNSBhbHNvIHJl
bW92ZXMgdGhlIGVmaWZiIC9kZXYvZmIwIGFuZCBpbnN0YWxscyBpdHMgb3duIC9kZXYvZmIwIGZi
ZGV2IGNvbXBhdAo+PiDCoMKgwqAgZGV2aWNlLCBmYmNvbiBpcyBub3RpZmllZCBvZiB0aGlzLCBi
dXQgaXMgc3RpbGwgZGVmZXJyZWQgYW5kIGxlYXZlcyB0aGUgZHVtbXkKPj4gwqDCoMKgIGNvbnNv
bGUgZHJpdmVyIGluIHBsYWNlIGFzIGNvbnNvbGUgZHJpdmVyLgo+PiA0LiBQbHltb3V0aCBsb2Fk
cywgYWxsb2NhdGVzIGEgbmV3IHNjYW4tb3V0IGJ1ZmZlciBhdCB0aGUgcGFuZWwncyBwcmVmZXJy
ZWQgcmVzb2x1dGlvbiwKPj4gwqDCoMKgIHBseW1vdXRoIHJlYWRzIHRoZSB2ZW5kb3ItbG9nbyB0
aHJvdWdoIHRoZSBCR1JUIEFDUEkgaW50ZXJmYWNlIGFuZCBmaWxscyB0aGUKPj4gwqDCoMKgIHNj
YW5vdXQtYnVmZmVyIHdpdGggdGhlIHZlbmRvci1sb2dvICsgYSBzcGlubmVyLiBUaGVuIHBseW1v
dXRoIGluc3RhbGxzIHRoZSBuZXcKPj4gwqDCoMKgIHNjYW5vdXQtYnVmZmVyIG9uIHRoZSBjcnRj
LCB0aGlzIGlzIGRvbmUgYXRvbWljYWxseSBkdXJpbmcgdnN5bmMsIHNvIHRoZSB1c2VyCj4+IMKg
wqDCoCBzZWVzIG5vIGNoYW5nZXMsIG90aGVyIHRoZW4gdGhlIHNwaW5uZXIgYXBwZWFyaW5nCj4+
IMKgwqDCoCAobm90ZSB0aGUgYWN0aXZlIFZUIGlzIG5vdyBpbiBncmFwaGljYWwgbW9kZSkKPj4g
NS4gRnJvbSBoZXJlIG9uIG5vdCBmbGlja2VyaW5nIGlzIGEgdXNlcnNwYWNlIHByb2JsZW0KPj4K
Pj4gQUZBSUNUIHRoaXMgc2hvdWxkIHdvcmsgZmluZSB3aXRoIHNpbXBsZWttcyB0b28sIHVubGVz
cyBpdCBjbGVhcnMgdGhlIHNjcmVlbgo+PiB0byBibGFjayB3aGVuIGl0IGJpbmRzLgo+IAo+IEkg
Zm9yZ290IHRvIGFkZCB0aGUgY29kZSB0aGF0IGNsZWFycyB0aGUgc2NyZWVuLCBidXQgdGhhdCdz
IHRoZSBjYXNlIGhlcmUuCj4gCj4gSW5zdGVhZCBvZiBhIHBsYW5lLWRpc2FibGUgb3BlcmF0aW9u
LCBzaW1wbGVkcm0gY2FuIGF0IGJlc3QgY2xlYXIgdGhlIHNjcmVlbi4gVGhpcyB3b3VsZCBoYXBw
ZW4gZHVyaW5nIHRoZSBpbml0aWFsIG1vZGUtY29uZmlnIHJlc2V0IElJUkMuCgpIbW0sIGNsZWFy
aW5nIHRoZSBzY3JlZW4gd2l0aG91dCBhbnkgKGF0b21pYykgbW9kZXNldHMgYmVpbmcgaW5pdGlh
dGVkIGJ5IGVpdGhlcgphbiBpbiBrZXJuZWwgZHJtLWNsaWVudCBvciB1c2Vyc3BhY2Ugc2VlbXMg
d3JvbmcsIHRoaXMgaXMgY2VydGFpbmx5IGRpZmZlcmVudCBmcm9tCndoYXQgdGhlIGk5MTUgZHJp
dmVyIGRvZXMuIFRoZSB3YXkgSSBzZWUgaXQgZWl0aGVyIGEgZHJtIGNsaWVudCBwcm92aWRlcyBh
IG5ldwpmcmFtZWJ1ZmZlciBpbiB3aGljaCBjYXNlIHlvdSBjb3B5IHRoYXQgb3ZlciB0aGUgb2xk
IGNvbnRlbnRzLCBlZmZlY3RpdmVseSBjbGVhcmluZwppdC4gT3IgYSBkcm0tY2xpZW50IGdldHMg
YSBoYW5kbGUgYW5kIGRyYXdzIHRvIHRoZSBjdXJyZW50IGZiIGRpcmVjdGx5LCBpbiB3aGljaApj
YXNlIGl0IGlzIHRoZSBjbGllbnRzIHJlc3BvbnNpYmlsaXR5IHRvIGNsZWFyIGl0IGl0c2VsZiBm
aXJzdC4KCklPVyBJIGJlbGlldmUgdGhhdCBzaW1wbGVkcm0gc2hvdWxkIG5vdCBjbGVhciB0aGUg
c2NyZWVuIGl0c2VsZiBhdCBhbGwuCgpSZWdhcmRzLAoKSGFucwoKCgo+IEJ1dCB3ZSBuZWVkIHRv
IGtlZXAgdGhlIGRpc3BsYXkgY29udGVudCBzdG9yZWQgaW4gYSBmcmFtZWJ1ZmZlciwgc28gcmVh
ZC1vdXQgaGVscGVycyBhcmUgcmVxdWlyZWQuIFRoZXJlIGFyZSBtb3JlIHVzZXJzIG9mIHRoZXNl
IHJlYWQtb3V0IGhlbHBlcnMuIEFkZGluZyB0aGVtIGF0IHNvbWUgcG9pbnQgcHJvYmFibHkgbWFr
ZXMgc2Vuc2UuCj4gCj4gT3RoZXIgZHJpdmVycyBtaWdodCBhbHNvIHdhbnQgdG8gcmVhZCB0aGUg
aW5pdGlhbCBjb25maWcgZnJvbSBzaW1wbGVkcm0gdmlhIHJlYWQtb3V0IGhlbHBlcnMuIEkgdGhp
bmsgb25seSBpOTE1IGN1cnJlbnRseSBzdXBwb3J0cyBzb21ldGhpbmcgbGlrZSB0aGF0IEFUTS4K
PiAKPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPiAKPj4KPj4gQW4gYWRkaXRpb24gdG8gdGhlIGFi
b3ZlIHNlcXVlbmNlLCBpZiBhdCBhbnkgdGltZSBlaXRoZXIgdGhlIGtlcm5lbCBvciB1c2Vyc3Bh
Y2UKPj4gcHJpbnRzIGEgbWVzc2FnZSB0byB0aGUgY29uc29sZTsgYW5kIGF0IHRoYXQgdGltZSBh
IGZiZGV2IGlzIHJlZ2lzdGVyZWQgdGhlbiBmYmNvbgo+PiB3aWxsIHRha2VvdmVyIGFzIHRoZSBj
b25zb2xlIGRyaXZlciBmcm9tIHRoZSBkdW1teSBkcml2ZXIgYW5kIGl0IHdpbGwgc3RhcnQgZHJh
d2luZwo+PiB0byB0aGUgcmVnaXN0ZXJlZCBmYmRldiAoMSksIGRlc3Ryb3lpbmcgdGhlIGZyYW1l
YnVmZmVyIGNvbnRlbnRzLiBBbHNvIGlmIGFueSBtZXNzYWdlcwo+PiB3aGVyZSBwcmludGVuZCB3
aGlsZSBubyBmYmRldiB3YXMgcmVnaXN0ZXJlZCwgdGhlbiBmYmNvbiB3aWxsIHRha2VvdmVyIHRo
ZSBjb25zb2xlCj4+IGFzIHNvb24gYXMgYSBmYmRldiBnZXRzIHJlZ2lzdGVyZWQuCj4+Cj4+IFNv
IHNpbmNlIHdlIGFscmVhZHkgaGF2ZSBkZWZlcnJlZC10YWtlb3ZlciBpbiB0aGUgZmJjb24gY29k
ZSwgSSB3b25kZXIgd2hhdCB5b3UKPj4gbWVhbiB3aGVuIHlvdSBhcmUgdGFsa2luZyBhYm91dCAi
cHJvdmlkZSBkZWZlcnJlZCB0YWtlb3ZlciIgZm9yIHNpbXBsZWttcz8KPj4KPj4gUmVnYXJkcywK
Pj4KPj4gSGFucwo+Pgo+Pgo+PiAxKSBFeGNlcHQgd2hlbiB0aGUgVlQgaGFzIGJlZW4gc3dpdGNo
ZWQgdG8gR0ZYIG1vZGUgd2hlbiB0aGlzIGhhcHBlbnMsIHRoZW4gZmJjb24KPj4gd2lsbCBkZWxh
eSB1c2luZyB0aGUgZmJkZXYgdW50aWwgdGhlIFZUIGlzIHN3aXRjaGVkIGJhY2sgdG8gdGV4dCBt
b2RlLgo+Pgo+Pgo+PiBwLnMuCj4+Cj4+IFRoaXMgaGFzIHRoZSBpbnRlcmVzdGluZyBzaWRlIGVm
ZmVjdCB0aGVuIHdoZW4gbG9nZ2luZyBpbnRvIGEgZGVza3RvcCBHVUkgc2Vzc2lvbjoKPj4ga2Vy
bmVsIC0+IHBseW1vdXRoIC0+IGdkbSAtPiBHTk9NRSB1c2VyIHNlc3Npb24KPj4KPj4gVGhlcmUg
bmV2ZXIgaXMgYW55IG91dHB1dCB0byB0aGUgdGV4dC1jb25zb2xlIGFuZCBmYmNvbiBuZXZlciB0
YWtlcy1vdmVyLCBzbyBvbgo+PiBtYW55IExhcHRvcHMgcnVubmluZyBzYXkgRmVkb3JhIHdvcmtz
dGF0aW9uIHRoZSBmYmNvbiBjb2RlIGlzIGFjdHVhbGx5IHVudXNlZAo+PiB1bnRpbCB0aGUgdXNl
ciBtYW51YWxseSBzd2l0Y2hlcyB0byBhbm90aGVyIHZpcnR1YWwtY29uc29sZSB0byBsb2cgaW4g
aW4KPj4gdGV4dC1tb2RlOgo+Pgo+PiBbaGFuc0B4MSB+XSQgZG1lc2cgfCBncmVwIC1FICdmYmNv
bnxDb25zb2xlOnxUcnVlY29sb3InCj4+IFvCoMKgwqAgMC4yNTg5MDRdIENvbnNvbGU6IGNvbG91
ciBkdW1teSBkZXZpY2UgODB4MjUKPj4gW8KgwqDCoCAxLjI3NDcyNl0gZWZpZmI6IFRydWVjb2xv
cjogc2l6ZT04Ojg6ODo4LCBzaGlmdD0yNDoxNjo4OjAKPj4gW8KgwqDCoCAxLjI3NDc2OF0gZmJj
b246IERlZmVycmluZyBjb25zb2xlIHRha2Utb3Zlcgo+PiBbwqDCoMKgIDIuNTQwODk0XSBmYmNv
bjogaTkxNWRybWZiIChmYjApIGlzIHByaW1hcnkgZGV2aWNlCj4+IFvCoMKgwqAgMi41NDA4OTZd
IGZiY29uOiBEZWZlcnJpbmcgY29uc29sZSB0YWtlLW92ZXIKPj4gW2hhbnNAeDEgfl0kIHVwdGlt
ZQo+PiDCoCAxMjoyOTozOSB1cMKgIDQ6MTkswqAgMSB1c2VyLMKgIGxvYWQgYXZlcmFnZTogMC41
OCwgMC43NSwgMC44MQo+Pgo+PiBMb29rIG1vbSBubyBmYmNvbgo+Pgo+Pgo+Pgo+Pgo+Pj4gwqDC
oMKgwqAqIHByb3ZpZGUgYm9vdHNwbGFzaCBEUk0gY2xpZW50Cj4+PiDCoMKgwqDCoCogbWFrZSBz
aW1wbGVrbXMgdXNhYmxlIHdpdGggQVJNLUVGSSBmYnMKPj4+Cj4+PiB2MjoKPj4+IMKgwqDCoMKg
KiByZW5hbWUgdG8gc2ltcGxlZHJtLCBhcGVydHVyZSBoZWxwZXJzCj4+PiDCoMKgwqDCoCogcmVv
cmdhbml6ZWQgcGF0Y2hlcwo+Pj4gwqDCoMKgwqAqIHVzZSBob3RwbHVnIGhlbHBlcnMgZm9yIHJl
bW92YWwgKERhbmllbCkKPj4+IMKgwqDCoMKgKiBhZGRlZCBEVCBtYXRjaCB0YWJsZXMgKFJvYikK
Pj4+IMKgwqDCoMKgKiB1c2Ugc2hhZG93LXBsYW5lIGhlbHBlcnMKPj4+IMKgwqDCoMKgKiBsb3Rz
IG9mIG1pbm9yIGNsZWFudXBzCj4+Pgo+Pj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Ry
aS1kZXZlbC9DQUtNSzd1SHRxSHlfb3o0VzdGK2htcDlpcXA3VzVSYThDeFB2Sj05QndtdmZVLU8w
Z2dAbWFpbC5nbWFpbC5jb20vCj4+PiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRl
dmVsLzE3NjE3NjIuM0hRTHJGczFLN0BuZXJkb3BvbGlzLwo+Pj4KPj4+IFRob21hcyBaaW1tZXJt
YW5uICgxMCk6Cj4+PiDCoMKgIGRybS9mb3JtYXQtaGVscGVyOiBQYXNzIGRlc3RpbmF0aW9uIHBp
dGNoIHRvIGRybV9mYl9tZW1jcHlfZHN0Y2xpcCgpCj4+PiDCoMKgIGRybS9mb3JtYXQtaGVscGVy
OiBBZGQgYmxpdHRlciBmdW5jdGlvbnMKPj4+IMKgwqAgZHJtL2FwZXJ0dXJlOiBNb3ZlIGZiZGV2
IGNvbmZsaWN0IGhlbHBlcnMgaW50byBkcm1fYXBlcnR1cmUuaAo+Pj4gwqDCoCBkcm0vYXBlcnR1
cmU6IEFkZCBpbmZyYXN0cnVjdHVyZSBmb3IgYXBlcnR1cmUgb3duZXJzaGlwCj4+PiDCoMKgIGRy
bTogQWRkIHNpbXBsZWRybSBkcml2ZXIKPj4+IMKgwqAgZHJtL3NpbXBsZWRybTogQWRkIGZiZGV2
IGVtdWxhdGlvbgo+Pj4gwqDCoCBkcm0vc2ltcGxlZHJtOiBJbml0aWFsaXplIGZyYW1lYnVmZmVy
IGRhdGEgZnJvbSBkZXZpY2UtdHJlZSBub2RlCj4+PiDCoMKgIGRybS9zaW1wbGVkcm06IEFjcXVp
cmUgY2xvY2tzIGZyb20gRFQgZGV2aWNlIG5vZGUKPj4+IMKgwqAgZHJtL3NpbXBsZWRybTogQWNx
dWlyZSByZWd1bGF0b3JzIGZyb20gRFQgZGV2aWNlIG5vZGUKPj4+IMKgwqAgZHJtL3NpbXBsZWRy
bTogQWNxdWlyZSBtZW1vcnkgYXBlcnR1cmUgZm9yIGZyYW1lYnVmZmVyCj4+Pgo+Pj4gwqAgRG9j
dW1lbnRhdGlvbi9ncHUvZHJtLWludGVybmFscy5yc3TCoMKgwqAgfMKgIDEyICsKPj4+IMKgIE1B
SU5UQUlORVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDcgKwo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL0tjb25maWfCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNyArCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vTWFr
ZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+Pj4gwqAgZHJpdmVy
cy9ncHUvZHJtL2RybV9hcGVydHVyZS5jwqDCoMKgwqDCoMKgwqDCoCB8IDI4NyArKysrKysrKwo+
Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmPCoMKgwqAgfMKgIDk2ICsr
LQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgfMKgwqAgMiAr
LQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3RpbnkvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCAxNyArCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdGlueS9NYWtlZmlsZcKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoCAxICsKPj4+IMKgIGRyaXZlcnMvZ3B1L2RybS90aW55L2NpcnJ1cy5jwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KPj4+IMKgIGRyaXZlcnMvZ3B1L2RybS90aW55L3Np
bXBsZWRybS5jwqDCoMKgwqDCoMKgIHwgOTMyICsrKysrKysrKysrKysrKysrKysrKysrKysKPj4+
IMKgIGluY2x1ZGUvZHJtL2RybV9hcGVydHVyZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCA5NiArKysKPj4+IMKgIGluY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDU2ICstCj4+PiDCoCBpbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5o
wqDCoMKgwqDCoMKgwqAgfMKgIDEwICstCj4+PiDCoCAxNCBmaWxlcyBjaGFuZ2VkLCAxNDY2IGlu
c2VydGlvbnMoKyksIDYwIGRlbGV0aW9ucygtKQo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS9kcm1fYXBlcnR1cmUuYwo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jCj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQg
aW5jbHVkZS9kcm0vZHJtX2FwZXJ0dXJlLmgKPj4+Cj4+PiAtLSAKPj4+IDIuMzAuMQo+Pj4KPj4K
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
