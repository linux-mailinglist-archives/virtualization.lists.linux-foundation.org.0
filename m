Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 909161EBD1C
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 15:31:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 273D98623E;
	Tue,  2 Jun 2020 13:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xz4sRek5znPv; Tue,  2 Jun 2020 13:31:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3E3BC861B2;
	Tue,  2 Jun 2020 13:31:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E41EC0178;
	Tue,  2 Jun 2020 13:31:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72900C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 668CF87999
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:31:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4tKiic5YuLMi
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:31:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 910C887986
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591104693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3UuSFOoTLf1u64HrlCpEbdeT2AgnRILXvuyVUe6Wag=;
 b=O/lPGxAVqryrY1cddeIh0gQ8Z25S7Po10omjMl7m+K4LDC9iTF5wZVGz13BUk/dDf2kal1
 9h1yycWV8HSnmUzX/gP0vvLPWSpIx45RCxdom4zGwksmr8SQv3Jq+S5TMfCwOFr/ou7eXQ
 qVVM96LYAdEzdwuzL7vDYnJLUFwZNOc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-RdCDQoGQNAqzMBqUTYo-Bw-1; Tue, 02 Jun 2020 09:31:22 -0400
X-MC-Unique: RdCDQoGQNAqzMBqUTYo-Bw-1
Received: by mail-wm1-f72.google.com with SMTP id g84so955260wmf.4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 02 Jun 2020 06:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=b3UuSFOoTLf1u64HrlCpEbdeT2AgnRILXvuyVUe6Wag=;
 b=dSo4cgzgUK5QC/gQxXWIVAO8f5xOiol2vC5qptFzQfxqXXe/OVjZxtmgB2iMFniOrr
 oWObejMieNxjcfSIoZDm0vT+zrw4J9WYyFYSwWMx/i9kNt4Sh+KJonLdxrVgmieleHdl
 FvSioZZjosYX3miq5/XQNa+YnWYzD3+mjnapOMxWCUIWze2y1b8wd75a2VON7rzEhx2c
 Rzz6wXWwsnOIYDUn8qQPKkq4F4nHBzEoxkbXUDcxkAgrYaQPzDeBOka+klrG/GvumOYL
 BfOy8zpn+Haif+xk2hgEO3jAGxCfp2AZ115hpZl0qJsGjGwFNNfHsOY731KwSwx97+fZ
 R6Dg==
X-Gm-Message-State: AOAM530GHfGnZ6C/tfUJsefHZj2bszIKAp6gMIIlJHUPm6OChujAUq2F
 RHp9YKW2HFgDhoTt4BHrxsRhmpZLTYN8xm5EJIImHn3TqjlRu6+1ZmTn1NBYsD74UA11NHJeyYB
 +tQdcwTJimUnlZGZhQkCmHHE5yiA6Lzsn16xXmf0YPQ==
X-Received: by 2002:adf:ecce:: with SMTP id s14mr14789313wro.154.1591104680989; 
 Tue, 02 Jun 2020 06:31:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhzCp7N+xdkukbytg74zX2M6EFznyG8/VyZ15EbaVCa6fcCkeslvcsieleP04VZHHIBXLV0w==
X-Received: by 2002:adf:ecce:: with SMTP id s14mr14789293wro.154.1591104680670; 
 Tue, 02 Jun 2020 06:31:20 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 n204sm3972286wma.5.2020.06.02.06.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 06:31:19 -0700 (PDT)
Date: Tue, 2 Jun 2020 09:31:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 4/6] vhost_vdpa: support doorbell mapping via mmap
Message-ID: <20200602093025-mutt-send-email-mst@kernel.org>
References: <20200529080303.15449-5-jasowang@redhat.com>
 <202006020308.kLXTHt4n%lkp@intel.com>
 <20200602005007-mutt-send-email-mst@kernel.org>
 <bd7dde11-b726-ee08-4e80-71fb784fa549@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bd7dde11-b726-ee08-4e80-71fb784fa549@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kbuild-all@lists.01.org, kbuild test robot <lkp@intel.com>,
 kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 lingshan.zhu@intel.com, lulu@redhat.com, rob.miller@broadcom.com
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

T24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMDI6NDk6MzhQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvMiDkuIvljYgxMjo1NiwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMDM6MjI6NDlBTSArMDgwMCwga2J1aWxkIHRl
c3Qgcm9ib3Qgd3JvdGU6Cj4gPiA+IEhpIEphc29uLAo+ID4gPiAKPiA+ID4gSSBsb3ZlIHlvdXIg
cGF0Y2ghIFlldCBzb21ldGhpbmcgdG8gaW1wcm92ZToKPiA+ID4gCj4gPiA+IFthdXRvIGJ1aWxk
IHRlc3QgRVJST1Igb24gdmhvc3QvbGludXgtbmV4dF0KPiA+ID4gW2Fsc28gYnVpbGQgdGVzdCBF
UlJPUiBvbiBsaW51cy9tYXN0ZXIgdjUuNyBuZXh0LTIwMjAwNTI5XQo+ID4gPiBbaWYgeW91ciBw
YXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwgcGxlYXNlIGRyb3AgdXMgYSBu
b3RlIHRvIGhlbHAKPiA+ID4gaW1wcm92ZSB0aGUgc3lzdGVtLiBCVFcsIHdlIGFsc28gc3VnZ2Vz
dCB0byB1c2UgJy0tYmFzZScgb3B0aW9uIHRvIHNwZWNpZnkgdGhlCj4gPiA+IGJhc2UgdHJlZSBp
biBnaXQgZm9ybWF0LXBhdGNoLCBwbGVhc2Ugc2VlaHR0cHM6Ly9zdGFja292ZXJmbG93LmNvbS9h
LzM3NDA2OTgyXQo+ID4gPiAKPiA+ID4gdXJsOmh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xp
bnV4L2NvbW1pdHMvSmFzb24tV2FuZy92RFBBLWRvb3JiZWxsLW1hcHBpbmcvMjAyMDA1MzEtMDcw
ODM0Cj4gPiA+IGJhc2U6aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvbXN0L3Zob3N0LmdpdCAgbGludXgtbmV4dAo+ID4gPiBjb25maWc6IG02OGstcmFuZGNv
bmZpZy1yMDExLTIwMjAwNjAxIChhdHRhY2hlZCBhcyAuY29uZmlnKQo+ID4gPiBjb21waWxlcjog
bTY4ay1saW51eC1nY2MgKEdDQykgOS4zLjAKPiA+ID4gcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0x
IGJ1aWxkKToKPiA+ID4gICAgICAgICAgd2dldGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50
LmNvbS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3NiaW4vbWFrZS5jcm9zcyAgLU8gfi9iaW4vbWFr
ZS5jcm9zcwo+ID4gPiAgICAgICAgICBjaG1vZCAreCB+L2Jpbi9tYWtlLmNyb3NzCj4gPiA+ICAg
ICAgICAgICMgc2F2ZSB0aGUgYXR0YWNoZWQgLmNvbmZpZyB0byBsaW51eCBidWlsZCB0cmVlCj4g
PiA+ICAgICAgICAgIENPTVBJTEVSX0lOU1RBTExfUEFUSD0kSE9NRS8wZGF5IENPTVBJTEVSPWdj
Yy05LjMuMCBtYWtlLmNyb3NzIEFSQ0g9bTY4awo+ID4gPiAKPiA+ID4gSWYgeW91IGZpeCB0aGUg
aXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZyBhcyBhcHByb3ByaWF0ZQo+ID4gPiBSZXBv
cnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3Q8bGtwQGludGVsLmNvbT4KPiA+ID4gCj4gPiA+IEFs
bCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+LCBvbGQgb25lcyBwcmVmaXhlZCBieSA8
PCk6Cj4gPiA+IAo+ID4gPiBkcml2ZXJzL3Zob3N0L3ZkcGEuYzogSW4gZnVuY3Rpb24gJ3Zob3N0
X3ZkcGFfZmF1bHQnOgo+ID4gPiA+ID4gZHJpdmVycy92aG9zdC92ZHBhLmM6NzU0OjIyOiBlcnJv
cjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ3BncHJvdF9ub25jYWNoZWQnIFst
V2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ID4gPiA3NTQgfCAgdm1hLT52
bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfbm9uY2FjaGVkKHZtYS0+dm1fcGFnZV9wcm90KTsKPiA+ID4g
fCAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+Cj4gPiA+ID4gPiBkcml2ZXJz
L3Zob3N0L3ZkcGEuYzo3NTQ6MjI6IGVycm9yOiBpbmNvbXBhdGlibGUgdHlwZXMgd2hlbiBhc3Np
Z25pbmcgdG8gdHlwZSAncGdwcm90X3QnIHtha2EgJ3N0cnVjdCA8YW5vbnltb3VzPid9IGZyb20g
dHlwZSAnaW50Jwo+ID4gPiBjYzE6IHNvbWUgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJv
cnMKPiA+ID4gCj4gPiA+IHZpbSArL3BncHJvdF9ub25jYWNoZWQgKzc1NCBkcml2ZXJzL3Zob3N0
L3ZkcGEuYwo+ID4gPiAKPiA+ID4gICAgIDc0MgkKPiA+ID4gICAgIDc0MwlzdGF0aWMgdm1fZmF1
bHRfdCB2aG9zdF92ZHBhX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+ID4gPiAgICAgNzQ0
CXsKPiA+ID4gICAgIDc0NQkJc3RydWN0IHZob3N0X3ZkcGEgKnYgPSB2bWYtPnZtYS0+dm1fZmls
ZS0+cHJpdmF0ZV9kYXRhOwo+ID4gPiAgICAgNzQ2CQlzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEg
PSB2LT52ZHBhOwo+ID4gPiAgICAgNzQ3CQljb25zdCBzdHJ1Y3QgdmRwYV9jb25maWdfb3BzICpv
cHMgPSB2ZHBhLT5jb25maWc7Cj4gPiA+ICAgICA3NDgJCXN0cnVjdCB2ZHBhX25vdGlmaWNhdGlv
bl9hcmVhIG5vdGlmeTsKPiA+ID4gICAgIDc0OQkJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEg
PSB2bWYtPnZtYTsKPiA+ID4gICAgIDc1MAkJdTE2IGluZGV4ID0gdm1hLT52bV9wZ29mZjsKPiA+
ID4gICAgIDc1MQkKPiA+ID4gICAgIDc1MgkJbm90aWZ5ID0gb3BzLT5nZXRfdnFfbm90aWZpY2F0
aW9uKHZkcGEsIGluZGV4KTsKPiA+ID4gICAgIDc1MwkKPiA+ID4gICA+IDc1NAkJdm1hLT52bV9w
YWdlX3Byb3QgPSBwZ3Byb3Rfbm9uY2FjaGVkKHZtYS0+dm1fcGFnZV9wcm90KTsKPiA+ID4gICAg
IDc1NQkJaWYgKHJlbWFwX3Bmbl9yYW5nZSh2bWEsIHZtZi0+YWRkcmVzcyAmIFBBR0VfTUFTSywK
PiA+ID4gICAgIDc1NgkJCQkgICAgbm90aWZ5LmFkZHIgPj4gUEFHRV9TSElGVCwgUEFHRV9TSVpF
LAo+ID4gPiAgICAgNzU3CQkJCSAgICB2bWEtPnZtX3BhZ2VfcHJvdCkpCj4gPiA+ICAgICA3NTgJ
CQlyZXR1cm4gVk1fRkFVTFRfU0lHQlVTOwo+ID4gPiAgICAgNzU5CQo+ID4gPiAgICAgNzYwCQly
ZXR1cm4gVk1fRkFVTFRfTk9QQUdFOwo+ID4gPiAgICAgNzYxCX0KPiA+ID4gICAgIDc2MgkKPiA+
IFllcyB3ZWxsLCBhbGwgdGhpcyByZW1hcHBpbmcgY2xlYXJseSBoYXMgbm8gY2hhbmNlIHRvIHdv
cmsKPiA+IG9uIHN5c3RlbXMgd2l0aG91dCBDT05GSUdfTU1VLgo+IAo+IAo+IEl0IGxvb2tzIHRv
IG1lIG1tYXAgY2FuIHdvcmsgYWNjb3JkaW5nIHRvIERvY3VtZW50YXRpb24vbm9tbXUtbW1hcC50
eHQuIEJ1dAo+IEknbSBub3Qgc3VyZSBpdCdzIHdvcnRoIHRvIGJvdGhlci4KPiAKPiBUaGFua3MK
CgpXZWxsCgppbnQgcmVtYXBfcGZuX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1
bnNpZ25lZCBsb25nIGFkZHIsCiAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHBmbiwgdW5z
aWduZWQgbG9uZyBzaXplLCBwZ3Byb3RfdCBwcm90KQp7CiAgICAgICAgaWYgKGFkZHIgIT0gKHBm
biA8PCBQQUdFX1NISUZUKSkKICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwoKICAgICAg
ICB2bWEtPnZtX2ZsYWdzIHw9IFZNX0lPIHwgVk1fUEZOTUFQIHwgVk1fRE9OVEVYUEFORCB8IFZN
X0RPTlREVU1QOwogICAgICAgIHJldHVybiAwOwp9CkVYUE9SVF9TWU1CT0wocmVtYXBfcGZuX3Jh
bmdlKTsKCgpTbyB0aGluZ3MgYXJlbid0IGdvaW5nIHRvIHdvcmsgaWYgeW91IGhhdmUgYSBmaXhl
ZCBQRk4Kd2hpY2ggaXMgdGhlIGNhc2Ugb2YgdGhlIGhhcmR3YXJlIGRldmljZS4KCgo+IAo+ID4g
Cj4gPiAKPiA+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
