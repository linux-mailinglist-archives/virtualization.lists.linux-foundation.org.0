Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C63A148F33A
	for <lists.virtualization@lfdr.de>; Sat, 15 Jan 2022 00:49:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC49040112;
	Fri, 14 Jan 2022 23:49:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mqHDNkX-hYuw; Fri, 14 Jan 2022 23:49:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 11CCF401D5;
	Fri, 14 Jan 2022 23:49:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A0FAC006E;
	Fri, 14 Jan 2022 23:49:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7142AC001E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Jan 2022 23:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4919C60B53
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Jan 2022 23:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5E28c6H0TvVg
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Jan 2022 23:49:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EE5F60B1B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Jan 2022 23:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642204156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i0nek0sWysaoX19xFLe6n0NQKHBRZwfdOywS+ke9TsM=;
 b=RJgPJx+EjCGVWXMlFCCrmp0me+YFLbMFc0tvdqf10ScGRizuVjpkFsGeDA66uYTCmkvzlD
 tA2XAGdQH5T0h4Kjo+DdQuLbB/28m+JE3WW4IrZqqdibkqbft8JY4uHQl4TFJQMpuYjvDq
 XAMvIuQtAeDm3Ox+6uPNrvclEJHsNiI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-cgW-yhyvOPe2EPEwa84INQ-1; Fri, 14 Jan 2022 18:49:13 -0500
X-MC-Unique: cgW-yhyvOPe2EPEwa84INQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so8935670wme.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Jan 2022 15:49:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=i0nek0sWysaoX19xFLe6n0NQKHBRZwfdOywS+ke9TsM=;
 b=6+Up6fnn9FqtW/vIdFAw0Ib8oyYndl0dcsIukYEix2zNg6cSkq/gKhXO69H4tYYkfu
 Ck6BtpTbwnGyq9aDDPm5XH3jq/l8CW1FAhb59QYhA3qs2oSyvogkv91PXRh4dfvF+x6W
 uu5lOXViGw9GP8DXzsiaYPL6dUu7/mP9JgDVuxbP7nCY6Qama+hmiYZ5RG6SV22yAjIq
 a4CBzHWs/Ee+ybff784flwagQ9+9xYqsCM6SUx9rLJ+PsH0JxaLA5m3epzqjhBUxsSnN
 B9IxjvqbWqur0zzuK2OMiENAOHUjFdS2+lspJuvH9yK0E4R0zjc4bklD+5W9T8nKPvpy
 AozA==
X-Gm-Message-State: AOAM530XhiboDOh1HDrZv0/j55r8c1MrB2m4s7t7N/9/5pwHMgkpQCEb
 ktBqLlroQnQ/LPPPUTayy9pUp87FftTQToZ+fvmdZBnyasTFJv/EJqjtbMbZHP0BUWIJlEzI8HK
 ystTba2E5gtw5BVr11+HbIW8+fQR2SuWPvTk18N2uuQ==
X-Received: by 2002:a5d:6d41:: with SMTP id k1mr10487326wri.478.1642204152514; 
 Fri, 14 Jan 2022 15:49:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhbcq3IrnxviaxbNRudcPg/bVTYJ0J6PhU04DEcOhtNqZFsRSUVQ2QTPmNay0KZc5zshsGqA==
X-Received: by 2002:a5d:6d41:: with SMTP id k1mr10487320wri.478.1642204152313; 
 Fri, 14 Jan 2022 15:49:12 -0800 (PST)
Received: from redhat.com ([2.55.154.210])
 by smtp.gmail.com with ESMTPSA id 14sm7954410wry.23.2022.01.14.15.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 15:49:11 -0800 (PST)
Date: Fri, 14 Jan 2022 18:49:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] virtio,vdpa,qemu_fw_cfg: features, cleanups, fixes
Message-ID: <20220114184825-mutt-send-email-mst@kernel.org>
References: <20220114153515-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220114153515-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: yun.wang@linux.alibaba.com, kvm@vger.kernel.org, trix@redhat.com,
 flyingpeng@tencent.com, virtualization@lists.linux-foundation.org,
 elic@nvidia.com, guanjun@linux.alibaba.com, jean-philippe@linaro.org,
 lkp@intel.com, xianting.tian@linux.alibaba.com, pasic@linux.ibm.com,
 eperezma@redhat.com, luolikang@nsfocus.com, wu000273@umn.edu,
 lvivier@redhat.com, keescook@chromium.org, somlo@cmu.edu, jiasheng@iscas.ac.cn,
 johan@kernel.org, christophe.jaillet@wanadoo.fr, flyingpenghao@gmail.com,
 dapeng1.mi@intel.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 labbott@kernel.org, gregkh@linuxfoundation.org, lingshan.zhu@intel.com
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

T24gRnJpLCBKYW4gMTQsIDIwMjIgYXQgMDM6MzU6MTVQTSAtMDUwMCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYzllNjYwNmM3
ZmU5MmI1MGEwMmNlNTFkZGE4MjU4NmViZGY5OWI0ODoKPiAKPiAgIExpbnV4IDUuMTYtcmM4ICgy
MDIyLTAxLTAyIDE0OjIzOjI1IC0wODAwKQo+IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCBy
ZXBvc2l0b3J5IGF0Ogo+IAo+ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvbXN0L3Zob3N0LmdpdCB0YWdzL2Zvcl9saW51cwo+IAo+IGZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byBmMDRhYzI2NzAyOWM4MDYzZmMzNTExNmIzODVjZDM3NjU2YjNj
ODFhOgo+IAo+ICAgdmlydGlvOiBhY2tub3dsZWRnZSBhbGwgZmVhdHVyZXMgYmVmb3JlIGFjY2Vz
cyAoMjAyMi0wMS0xNCAxNDo1ODo0MSAtMDUwMCkKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gdmlydGlvLHZkcGEs
cWVtdV9md19jZmc6IGZlYXR1cmVzLCBjbGVhbnVwcywgZml4ZXMKPiAKPiBJT01NVSBieXBhc3Mg
c3VwcG9ydCBpbiB2aXJ0aW8taW9tbXUKPiBwYXJ0aWFsIHN1cHBvcnQgZm9yIDwgTUFYX09SREVS
IC0gMSBncmFudWxhcml0eSBmb3IgdmlydGlvLW1lbQo+IGRyaXZlcl9vdmVycmlkZSBmb3IgdmRw
YQo+IHN5c2ZzIEFCSSBkb2N1bWVudGF0aW9uIGZvciB2ZHBhCj4gbXVsdGlxdWV1ZSBjb25maWcg
c3VwcG9ydCBmb3IgbWx4NSB2ZHBhCj4gCj4gTWlzYyBmaXhlcywgY2xlYW51cHMuCj4gCj4gU2ln
bmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KCnNlbGYtTkFD
SyBhdCBhdXRob3IncyByZXF1ZXN0LgoKV2lsbCBzZW5kIHYyLiBTb3JyeS4KCj4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
IENocmlzdG9waGUgSkFJTExFVCAoMSk6Cj4gICAgICAgZW5pX3ZkcGE6IFNpbXBsaWZ5ICdlbmlf
dmRwYV9wcm9iZSgpJwo+IAo+IERhcGVuZyBNaSAoMSk6Cj4gICAgICAgdmlydGlvOiBmaXggYSB0
eXBvIGluIGZ1bmN0aW9uICJ2cF9tb2Rlcm5fcmVtb3ZlIiBjb21tZW50cy4KPiAKPiBEYXZpZCBI
aWxkZW5icmFuZCAoMik6Cj4gICAgICAgdmlydGlvLW1lbTogcHJlcGFyZSBwYWdlIG9ubGluaW5n
IGNvZGUgZm9yIGdyYW51bGFyaXR5IHNtYWxsZXIgdGhhbiBNQVhfT1JERVIgLSAxCj4gICAgICAg
dmlydGlvLW1lbTogcHJlcGFyZSBmYWtlIHBhZ2Ugb25saW5pbmcgY29kZSBmb3IgZ3JhbnVsYXJp
dHkgc21hbGxlciB0aGFuIE1BWF9PUkRFUiAtIDEKPiAKPiBFbGkgQ29oZW4gKDIwKToKPiAgICAg
ICBuZXQvbWx4NV92ZHBhOiBPZmZlciBWSVJUSU9fTkVUX0ZfTVRVIHdoZW4gc2V0dGluZyBNVFUK
PiAgICAgICB2ZHBhL21seDU6IEZpeCB3cm9uZyBjb25maWd1cmF0aW9uIG9mIHZpcnRpb192ZXJz
aW9uXzFfMAo+ICAgICAgIHZkcGE6IFByb3ZpZGUgaW50ZXJmYWNlIHRvIHJlYWQgZHJpdmVyIGZl
YXR1cmVzCj4gICAgICAgdmRwYS9tbHg1OiBEaXN0cmlidXRlIFJYIHZpcnRxdWV1ZXMgaW4gUlFU
IG9iamVjdAo+ICAgICAgIHZkcGE6IFN5bmMgY2FsbHMgc2V0L2dldCBjb25maWcvc3RhdHVzIHdp
dGggY2ZfbXV0ZXgKPiAgICAgICB2ZHBhOiBSZWFkIGRldmljZSBjb25maWd1cmF0aW9uIG9ubHkg
aWYgRkVBVFVSRVNfT0sKPiAgICAgICB2ZHBhOiBBbGxvdyB0byBjb25maWd1cmUgbWF4IGRhdGEg
dmlydHF1ZXVlcwo+ICAgICAgIHZkcGEvbWx4NTogRml4IGNvbmZpZ19hdHRyX21hc2sgYXNzaWdu
bWVudAo+ICAgICAgIHZkcGEvbWx4NTogU3VwcG9ydCBjb25maWd1cmluZyBtYXggZGF0YSB2aXJ0
cXVldWUKPiAgICAgICB2ZHBhOiBBZGQgc3VwcG9ydCBmb3IgcmV0dXJuaW5nIGRldmljZSBjb25m
aWd1cmF0aW9uIGluZm9ybWF0aW9uCj4gICAgICAgdmRwYS9tbHg1OiBSZXN0b3JlIGN1cl9udW1f
dnFzIGluIGNhc2Ugb2YgZmFpbHVyZSBpbiBjaGFuZ2VfbnVtX3FwcygpCj4gICAgICAgdmRwYTog
U3VwcG9ydCByZXBvcnRpbmcgbWF4IGRldmljZSBjYXBhYmlsaXRpZXMKPiAgICAgICB2ZHBhL21s
eDU6IFJlcG9ydCBtYXggZGV2aWNlIGNhcGFiaWxpdGllcwo+ICAgICAgIHZkcGEvdmRwYV9zaW06
IENvbmZpZ3VyZSBtYXggc3VwcG9ydGVkIHZpcnRxdWV1ZXMKPiAgICAgICB2ZHBhOiBVc2UgQklU
X1VMTCBmb3IgYml0IG9wZXJhdGlvbnMKPiAgICAgICB2ZHBhL3ZkcGFfc2ltX25ldDogUmVwb3J0
IG1heCBkZXZpY2UgY2FwYWJpbGl0aWVzCj4gICAgICAgdmRwYTogQXZvaWQgdGFraW5nIGNmX211
dGV4IGxvY2sgb24gZ2V0IHN0YXR1cwo+ICAgICAgIHZkcGE6IFByb3RlY3QgdmRwYSByZXNldCB3
aXRoIGNmX211dGV4Cj4gICAgICAgdmRwYS9tbHg1OiBGaXggaXNfaW5kZXhfdmFsaWQoKSB0byBy
ZWZlciB0byBmZWF0dXJlcwo+ICAgICAgIHZkcGEvbWx4NTogRml4IHRyYWNraW5nIG9mIGN1cnJl
bnQgbnVtYmVyIG9mIFZRcwo+IAo+IEV1Z2VuaW8gUMOpcmV6ICgyKToKPiAgICAgICB2ZHBhOiBB
dm9pZCBkdXBsaWNhdGUgY2FsbCB0byB2cF92ZHBhIGdldF9zdGF0dXMKPiAgICAgICB2ZHBhOiBN
YXJrIHZkcGFfY29uZmlnX29wcy5nZXRfdnFfbm90aWZpY2F0aW9uIGFzIG9wdGlvbmFsCj4gCj4g
R3Vhbmp1biAoMSk6Cj4gICAgICAgdmR1c2U6IG1vdmluZyBrdmZyZWUgaW50byBjYWxsZXIKPiAK
PiBKZWFuLVBoaWxpcHBlIEJydWNrZXIgKDUpOgo+ICAgICAgIGlvbW11L3ZpcnRpbzogQWRkIGRl
ZmluaXRpb25zIGZvciBWSVJUSU9fSU9NTVVfRl9CWVBBU1NfQ09ORklHCj4gICAgICAgaW9tbXUv
dmlydGlvOiBTdXBwb3J0IGJ5cGFzcyBkb21haW5zCj4gICAgICAgaW9tbXUvdmlydGlvOiBTb3J0
IHJlc2VydmVkIHJlZ2lvbnMKPiAgICAgICBpb21tdS92aXJ0aW86IFBhc3MgZW5kIGFkZHJlc3Mg
dG8gdmlvbW11X2FkZF9tYXBwaW5nKCkKPiAgICAgICBpb21tdS92aXJ0aW86IFN1cHBvcnQgaWRl
bnRpdHktbWFwcGVkIGRvbWFpbnMKPiAKPiBKb2hhbiBIb3ZvbGQgKDQpOgo+ICAgICAgIGZpcm13
YXJlOiBxZW11X2Z3X2NmZzogZml4IE5VTEwtcG9pbnRlciBkZXJlZiBvbiBkdXBsaWNhdGUgZW50
cmllcwo+ICAgICAgIGZpcm13YXJlOiBxZW11X2Z3X2NmZzogZml4IGtvYmplY3QgbGVhayBpbiBw
cm9iZSBlcnJvciBwYXRoCj4gICAgICAgZmlybXdhcmU6IHFlbXVfZndfY2ZnOiBmaXggc3lzZnMg
aW5mb3JtYXRpb24gbGVhawo+ICAgICAgIGZpcm13YXJlOiBxZW11X2Z3X2NmZzogcmVtb3ZlIHN5
c2ZzIGVudHJpZXMgZXhwbGljaXRseQo+IAo+IExhdXJhIEFiYm90dCAoMSk6Cj4gICAgICAgdmRw
YTogY2xlYW4gdXAgZ2V0X2NvbmZpZ19zaXplIHJldCB2YWx1ZSBoYW5kbGluZwo+IAo+IE1pY2hh
ZWwgUy4gVHNpcmtpbiAoNSk6Cj4gICAgICAgdmlydGlvOiB3cmFwIGNvbmZpZy0+cmVzZXQgY2Fs
bHMKPiAgICAgICBod3JuZzogdmlydGlvIC0gdW5yZWdpc3RlciBkZXZpY2UgYmVmb3JlIHJlc2V0
Cj4gICAgICAgdmlydGlvX3Jpbmc6IG1hcmsgcmluZyB1bnVzZWQgb24gZXJyb3IKPiAgICAgICB2
aXJ0aW86IHVuZXhwb3J0IHZpcnRpb19maW5hbGl6ZV9mZWF0dXJlcwo+ICAgICAgIHZpcnRpbzog
YWNrbm93bGVkZ2UgYWxsIGZlYXR1cmVzIGJlZm9yZSBhY2Nlc3MKPiAKPiBQZW5nIEhhbyAoMik6
Cj4gICAgICAgdmlydGlvL3ZpcnRpb19tZW06IGhhbmRsZSBhIHBvc3NpYmxlIE5VTEwgYXMgYSBt
ZW1jcHkgcGFyYW1ldGVyCj4gICAgICAgdmlydGlvL3ZpcnRpb19wY2lfbGVnYWN5X2RldjogZW5z
dXJlIHRoZSBjb3JyZWN0IHJldHVybiB2YWx1ZQo+IAo+IFN0ZWZhbm8gR2FyemFyZWxsYSAoMik6
Cj4gICAgICAgZG9jczogZG9jdW1lbnQgc3lzZnMgQUJJIGZvciB2RFBBIGJ1cwo+ICAgICAgIHZk
cGE6IGFkZCBkcml2ZXJfb3ZlcnJpZGUgc3VwcG9ydAo+IAo+IFhpYW50aW5nIFRpYW4gKDEpOgo+
ICAgICAgIHZob3N0L3Rlc3Q6IGZpeCBtZW1vcnkgbGVhayBvZiB2aG9zdCB2aXJ0cXVldWVzCj4g
Cj4gWmh1IExpbmdzaGFuICgxKToKPiAgICAgICBpZmN2Zi92RFBBOiBmaXggbWlzdXNlIHZpcnRp
by1uZXQgZGV2aWNlIGNvbmZpZyBzaXplIGZvciBibGsgZGV2Cj4gCj4g546L6LSHICgxKToKPiAg
ICAgICB2aXJ0aW8tcGNpOiBmaXggdGhlIGNvbmZ1c2luZyBlcnJvciBtZXNzYWdlCj4gCj4gIERv
Y3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtYnVzLXZkcGEgICB8ICA1NyArKysrKysrKysr
Cj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4g
IGFyY2gvdW0vZHJpdmVycy92aXJ0LXBjaS5jICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBk
cml2ZXJzL2Jsb2NrL3ZpcnRpb19ibGsuYyAgICAgICAgICAgICAgICAgfCAgIDQgKy0KPiAgZHJp
dmVycy9ibHVldG9vdGgvdmlydGlvX2J0LmMgICAgICAgICAgICAgIHwgICAyICstCj4gIGRyaXZl
cnMvY2hhci9od19yYW5kb20vdmlydGlvLXJuZy5jICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJz
L2NoYXIvdmlydGlvX2NvbnNvbGUuYyAgICAgICAgICAgICAgfCAgIDQgKy0KPiAgZHJpdmVycy9j
cnlwdG8vdmlydGlvL3ZpcnRpb19jcnlwdG9fY29yZS5jIHwgICA4ICstCj4gIGRyaXZlcnMvZmly
bXdhcmUvYXJtX3NjbWkvdmlydGlvLmMgICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2Zpcm13
YXJlL3FlbXVfZndfY2ZnLmMgICAgICAgICAgICAgfCAgMjEgKystLQo+ICBkcml2ZXJzL2dwaW8v
Z3Bpby12aXJ0aW8uYyAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2ttcy5jICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtdmlydGlvLmMgICAgICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2lvbW11L3ZpcnRp
by1pb21tdS5jICAgICAgICAgICAgICAgfCAxMTUgKysrKysrKysrKysrKysrKy0tLS0KPiAgZHJp
dmVycy9uZXQvY2FpZi9jYWlmX3ZpcnRpby5jICAgICAgICAgICAgIHwgICAyICstCj4gIGRyaXZl
cnMvbmV0L3ZpcnRpb19uZXQuYyAgICAgICAgICAgICAgICAgICB8ICAgNCArLQo+ICBkcml2ZXJz
L25ldC93aXJlbGVzcy9tYWM4MDIxMV9od3NpbS5jICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy9u
dmRpbW0vdmlydGlvX3BtZW0uYyAgICAgICAgICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvcnBt
c2cvdmlydGlvX3JwbXNnX2J1cy5jICAgICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL3Njc2kv
dmlydGlvX3Njc2kuYyAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy92ZHBhL2Fs
aWJhYmEvZW5pX3ZkcGEuYyAgICAgICAgICAgIHwgIDI4ICsrKy0tCj4gIGRyaXZlcnMvdmRwYS9p
ZmN2Zi9pZmN2Zl9iYXNlLmMgICAgICAgICAgICB8ICA0MSArKysrKystLQo+ICBkcml2ZXJzL3Zk
cGEvaWZjdmYvaWZjdmZfYmFzZS5oICAgICAgICAgICAgfCAgIDkgKy0KPiAgZHJpdmVycy92ZHBh
L2lmY3ZmL2lmY3ZmX21haW4uYyAgICAgICAgICAgIHwgIDQwICsrKy0tLS0KPiAgZHJpdmVycy92
ZHBhL21seDUvbmV0L21seDVfdm5ldC5jICAgICAgICAgIHwgMTU2ICsrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLQo+ICBkcml2ZXJzL3ZkcGEvdmRwYS5jICAgICAgICAgICAgICAgICAgICAgICAg
fCAxNjMgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPiAgZHJpdmVycy92ZHBhL3ZkcGFf
c2ltL3ZkcGFfc2ltLmMgICAgICAgICAgIHwgIDIxICsrLS0KPiAgZHJpdmVycy92ZHBhL3ZkcGFf
c2ltL3ZkcGFfc2ltX25ldC5jICAgICAgIHwgICAyICsKPiAgZHJpdmVycy92ZHBhL3ZkcGFfdXNl
ci92ZHVzZV9kZXYuYyAgICAgICAgIHwgIDE5ICsrKy0KPiAgZHJpdmVycy92ZHBhL3ZpcnRpb19w
Y2kvdnBfdmRwYS5jICAgICAgICAgIHwgIDE2ICsrLQo+ICBkcml2ZXJzL3Zob3N0L3Rlc3QuYyAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL3Zob3N0L3ZkcGEuYyAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMTIgKy0tCj4gIGRyaXZlcnMvdmlydGlvL3ZpcnRpby5jICAg
ICAgICAgICAgICAgICAgICB8ICA0MCArKysrLS0tCj4gIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19i
YWxsb29uLmMgICAgICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9faW5w
dXQuYyAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy92aXJ0aW8vdmlydGlvX21lbS5j
ICAgICAgICAgICAgICAgIHwgMTE0ICsrKysrKysrKysrKystLS0tLS0tCj4gIGRyaXZlcnMvdmly
dGlvL3ZpcnRpb19wY2lfbGVnYWN5LmMgICAgICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL3ZpcnRp
by92aXJ0aW9fcGNpX2xlZ2FjeV9kZXYuYyAgICAgfCAgIDQgKy0KPiAgZHJpdmVycy92aXJ0aW8v
dmlydGlvX3BjaV9tb2Rlcm5fZGV2LmMgICAgIHwgICAyICstCj4gIGRyaXZlcnMvdmlydGlvL3Zp
cnRpb19yaW5nLmMgICAgICAgICAgICAgICB8ICAgNCArLQo+ICBkcml2ZXJzL3ZpcnRpby92aXJ0
aW9fdmRwYS5jICAgICAgICAgICAgICAgfCAgIDcgKy0KPiAgZnMvZnVzZS92aXJ0aW9fZnMuYyAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstCj4gIGluY2x1ZGUvbGludXgvdmRwYS5oICAg
ICAgICAgICAgICAgICAgICAgICB8ICAzOSArKysrKy0tCj4gIGluY2x1ZGUvbGludXgvdmlydGlv
LmggICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBpbmNsdWRlL3VhcGkvbGludXgvdmRw
YS5oICAgICAgICAgICAgICAgICAgfCAgIDYgKysKPiAgaW5jbHVkZS91YXBpL2xpbnV4L3ZpcnRp
b19pb21tdS5oICAgICAgICAgIHwgICA4ICstCj4gIG5ldC85cC90cmFuc192aXJ0aW8uYyAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBuZXQvdm13X3Zzb2NrL3ZpcnRpb190cmFuc3Bv
cnQuYyAgICAgICAgICAgfCAgIDQgKy0KPiAgc291bmQvdmlydGlvL3ZpcnRpb19jYXJkLmMgICAg
ICAgICAgICAgICAgIHwgICA0ICstCj4gIDQ5IGZpbGVzIGNoYW5nZWQsIDcwNiBpbnNlcnRpb25z
KCspLCAyODYgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy12ZHBhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
