Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F166546CA
	for <lists.virtualization@lfdr.de>; Thu, 22 Dec 2022 20:44:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBEE381EE5;
	Thu, 22 Dec 2022 19:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBEE381EE5
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FpUxj0mP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ckRjI8-hZM_b; Thu, 22 Dec 2022 19:43:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 43CB081EF0;
	Thu, 22 Dec 2022 19:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43CB081EF0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8C21C007C;
	Thu, 22 Dec 2022 19:43:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EC8DC0070
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 19:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71D464031E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 19:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71D464031E
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=FpUxj0mP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HN1m2a5TJt3C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 19:43:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2494E40260
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2494E40260
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 19:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671738232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jqg4l9ppU4/LoATwhQrDYp/3VHTevvJa8cFjxg3vEVw=;
 b=FpUxj0mP4u0jZM1D1rxiX4cch0ZrRjvjS1Sm8/2DL5RQrIypkCjH5dLJjFB6ULy1cHPML+
 Y3AmiskEGMMF8DM4mZqpKAPGaInc/niJx7npz2k6fahzmdKkHcqgO+3wAk+ggVKPosPw3U
 luHBTU7Sz4HrUnOpTypa5qc+EWw8yg8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-150-MtSOBM0XNtOk0AAdbBTYVg-1; Thu, 22 Dec 2022 14:43:51 -0500
X-MC-Unique: MtSOBM0XNtOk0AAdbBTYVg-1
Received: by mail-ej1-f70.google.com with SMTP id
 hs18-20020a1709073e9200b007c0f9ac75f9so2037319ejc.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 11:43:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jqg4l9ppU4/LoATwhQrDYp/3VHTevvJa8cFjxg3vEVw=;
 b=4vcF1MrKOMa0Hp0cS543N0QZkr34rnGIb3gLxeKXNablzDIDIfmpxxSpL0XVPo2AhN
 zVeV0WQB5yoyNyANhPWOrnJhAhfblHK6AOg/GwcF+Ksn4eMWd5mF+Y/Egni/UFg4IwRy
 4tFqgqITMtsYyMae++zrsmBZfZiPx+Eex/5e2RXflnSmVHN1RvfUP8wkDVrH+zu+8khs
 0FY5LU8eZwYwitQHHOL5oeKLx71Lph3Sd65aOk7nlcZQXJL88+q6MrzwsZEPemJkDJ2E
 krCqPn2KomsVBv/9eOI9WAsjEy3rAzlGEM6d9f6qcOOa8N7923pBlKWjDOQCrBAkIFEI
 Zi+Q==
X-Gm-Message-State: AFqh2kojGfh/yKrA5NhYtT6SczdocA5ZeTsWahGTZWfR0kDvFG+Fc9P+
 Btf8ltUXujG90VSasW/hbA4l+FazbQdkvbdR0eJVhj2zVLNIy3Y6WBQCo6V7a8i+tlKnMZVG//w
 XSXvXEIdOcYbpVjPl8a9f4XS1ZVylmnOOsIFSGAd6fQ==
X-Received: by 2002:a17:907:6d0c:b0:7c1:652:d109 with SMTP id
 sa12-20020a1709076d0c00b007c10652d109mr6520524ejc.35.1671738230457; 
 Thu, 22 Dec 2022 11:43:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvLlDzf2yxva+GWIB8SmxNohbeD3HjmEQmM7Dh7TSaob2mNG9+TQ7FtyP3KjZNNoenU+30zOA==
X-Received: by 2002:a17:907:6d0c:b0:7c1:652:d109 with SMTP id
 sa12-20020a1709076d0c00b007c10652d109mr6520497ejc.35.1671738230166; 
 Thu, 22 Dec 2022 11:43:50 -0800 (PST)
Received: from redhat.com ([2.55.175.215]) by smtp.gmail.com with ESMTPSA id
 v1-20020a170906292100b0073c10031dc9sm566202ejd.80.2022.12.22.11.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 11:43:49 -0800 (PST)
Date: Thu, 22 Dec 2022 14:43:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] virtio,vhost,vdpa: features, fixes, cleanups
Message-ID: <20221222144343-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: bobby.eshleman@bytedance.com, kvm@vger.kernel.org, mst@redhat.com,
 yuancan@huawei.com, virtualization@lists.linux-foundation.org,
 weiyongjun1@huawei.com, elic@nvidia.com, set_pte_at@outlook.com,
 m.szyprowski@samsung.com, almasrymina@google.com, sfr@canb.auug.org.au,
 dave@stgolabs.net, anders.roxell@linaro.org, lulu@redhat.com,
 ruanjinjie@huawei.com, sunnanyong@huawei.com, rafaelmendsr@gmail.com,
 pizhenwei@bytedance.com, eperezma@redhat.com, angus.chen@jaguarmicro.com,
 lkft@linaro.org, colin.i.king@gmail.com, sammler@google.com, nathan@kernel.org,
 leiyang@redhat.com, harshit.m.mogalapalli@oracle.com, wangjianli@cdjrlc.com,
 gautam.dawar@xilinx.com, pabeni@redhat.com, dengshaomin@cdjrlc.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dmitry.fomichev@wdc.com, wangrong68@huawei.com
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA4MzBiM2M2OGMxZmIxZTkxNzYwMjhk
MDJlZjg2ZjNjZjc2YWEyNDc2OgoKICBMaW51eCA2LjEgKDIwMjItMTItMTEgMTQ6MTU6MTggLTA4
MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXN0L3Zob3N0LmdpdCB0YWdz
L2Zvcl9saW51cwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDk4ZGQ2YjJlZjUwZDZm
Nzg3NjYwNmE4NmM4ZDhhNzY3YzlmZWY2ZjU6CgogIHZpcnRpb19ibGs6IG1hcmsgYWxsIHpvbmUg
ZmllbGRzIExFICgyMDIyLTEyLTIyIDE0OjMyOjM2IC0wNTAwKQoKCk5vdGU6IG1lcmdpbmcgdGhp
cyB1cHN0cmVhbSByZXN1bHRzIGluIGEgY29uZmxpY3QKYmV0d2VlbiBjb21taXQ6CgogIGRlNGVk
YTlkZTJkOSAoInVzZSBsZXNzIGNvbmZ1c2luZyBuYW1lcyBmb3IgaW92X2l0ZXIgZGlyZWN0aW9u
IGluaXRpYWxpemVycyIpCgpmcm9tIExpbnVzJyB0cmVlIGFuZCBjb21taXQ6CgogICgidmlydGlv
L3Zzb2NrOiByZXBsYWNlIHZpcnRpb192c29ja19wa3Qgd2l0aCBza19idWZmIikKCmZyb20gdGhp
cyB0cmVlLgoKVGhpcyByZXNvbHV0aW9uIGJlbG93IGZpeGVzIGl0IHVwLCBkdWUgdG8gU3RlcGhl
biBSb3Rod2VsbAoKZGlmZiAtLWNjIGRyaXZlcnMvdmhvc3QvdnNvY2suYwppbmRleCBjZDZmNzc3
NjAxM2EsODMwYmM4MjNhZGRjLi4wMDAwMDAwMDAwMDAKLS0tIGEvZHJpdmVycy92aG9zdC92c29j
ay5jCisrKyBiL2RyaXZlcnMvdmhvc3QvdnNvY2suYwpAQEAgLTE2NSw4IC0xNTcsOSArMTU3LDkg
QEBAIHZob3N0X3RyYW5zcG9ydF9kb19zZW5kX3BrdChzdHJ1Y3QgdmhvcwogIAkJCWJyZWFrOwog
IAkJfQogIAogLQkJaW92X2l0ZXJfaW5pdCgmaW92X2l0ZXIsIFJFQUQsICZ2cS0+aW92W291dF0s
IGluLCBpb3ZfbGVuKTsKICsJCWlvdl9pdGVyX2luaXQoJmlvdl9pdGVyLCBJVEVSX0RFU1QsICZ2
cS0+aW92W291dF0sIGluLCBpb3ZfbGVuKTsKLSAJCXBheWxvYWRfbGVuID0gcGt0LT5sZW4gLSBw
a3QtPm9mZjsKKyAJCXBheWxvYWRfbGVuID0gc2tiLT5sZW47CisgCQloZHIgPSB2aXJ0aW9fdnNv
Y2tfaGRyKHNrYik7CiAgCiAgCQkvKiBJZiB0aGUgcGFja2V0IGlzIGdyZWF0ZXIgdGhhbiB0aGUg
c3BhY2UgYXZhaWxhYmxlIGluIHRoZQogIAkJICogYnVmZmVyLCB3ZSBzcGxpdCBpdCB1c2luZyBt
dWx0aXBsZSBidWZmZXJzLgpAQEAgLTM2NiwxOCAtMzQwLDIxICszNDAsMjIgQEBAIHZob3N0X3Zz
b2NrX2FsbG9jX3NrYihzdHJ1Y3Qgdmhvc3RfdmlydAogIAkJcmV0dXJuIE5VTEw7CiAgCX0KICAK
LSAJcGt0ID0ga3phbGxvYyhzaXplb2YoKnBrdCksIEdGUF9LRVJORUwpOwotIAlpZiAoIXBrdCkK
KyAJbGVuID0gaW92X2xlbmd0aCh2cS0+aW92LCBvdXQpOworIAorIAkvKiBsZW4gY29udGFpbnMg
Ym90aCBwYXlsb2FkIGFuZCBoZHIgKi8KKyAJc2tiID0gdmlydGlvX3Zzb2NrX2FsbG9jX3NrYihs
ZW4sIEdGUF9LRVJORUwpOworIAlpZiAoIXNrYikKICAJCXJldHVybiBOVUxMOwogIAogLQlpb3Zf
aXRlcl9pbml0KCZpb3ZfaXRlciwgV1JJVEUsIHZxLT5pb3YsIG91dCwgbGVuKTsKICsJbGVuID0g
aW92X2xlbmd0aCh2cS0+aW92LCBvdXQpOwogKwlpb3ZfaXRlcl9pbml0KCZpb3ZfaXRlciwgSVRF
Ul9TT1VSQ0UsIHZxLT5pb3YsIG91dCwgbGVuKTsKICAKLSAJbmJ5dGVzID0gY29weV9mcm9tX2l0
ZXIoJnBrdC0+aGRyLCBzaXplb2YocGt0LT5oZHIpLCAmaW92X2l0ZXIpOwotIAlpZiAobmJ5dGVz
ICE9IHNpemVvZihwa3QtPmhkcikpIHsKKyAJaGRyID0gdmlydGlvX3Zzb2NrX2hkcihza2IpOwor
IAluYnl0ZXMgPSBjb3B5X2Zyb21faXRlcihoZHIsIHNpemVvZigqaGRyKSwgJmlvdl9pdGVyKTsK
KyAJaWYgKG5ieXRlcyAhPSBzaXplb2YoKmhkcikpIHsKICAJCXZxX2Vycih2cSwgIkV4cGVjdGVk
ICV6dSBieXRlcyBmb3IgcGt0LT5oZHIsIGdvdCAlenUgYnl0ZXNcbiIsCi0gCQkgICAgICAgc2l6
ZW9mKHBrdC0+aGRyKSwgbmJ5dGVzKTsKLSAJCWtmcmVlKHBrdCk7CisgCQkgICAgICAgc2l6ZW9m
KCpoZHIpLCBuYnl0ZXMpOworIAkJa2ZyZWVfc2tiKHNrYik7CiAgCQlyZXR1cm4gTlVMTDsKICAJ
fQogIAoKSXQgY2FuIGFsc28gYmUgZm91bmQgaW4gbGludXgtbmV4dCwgc2VlIG5leHQtMjAyMjEy
MjAuCgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQp2aXJ0aW8sdmhvc3QsdmRwYTogZmVhdHVyZXMsIGZpeGVzLCBjbGVhbnVw
cwoKem9uZWQgYmxvY2sgZGV2aWNlIHN1cHBvcnQKbGlmZXRpbWUgc3RhdHMgc3VwcG9ydCAoZm9y
IHZpcnRpbyBkZXZpY2VzIGJhY2tlZCBieSBtZW1vcnkgc3VwcG9ydGluZyB0aGF0KQp2c29jayBy
ZXdvcmsgdG8gdXNlIHNrYnVmZnMKaWZjdmYgZmVhdHVyZXMgcHJvdmlzaW9uaW5nCm5ldyBTb2xp
ZE5FVCBEUFUgZHJpdmVyCgpTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEBy
ZWRoYXQuY29tPgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpBbHZhcm8gS2Fyc3ogKDUpOgogICAgICBBZGQgU29saWRSdW4g
dmVuZG9yIGlkCiAgICAgIE5ldyBQQ0kgcXVpcmsgZm9yIFNvbGlkUnVuIFNORVQgRFBVLgogICAg
ICB2aXJ0aW86IHZkcGE6IG5ldyBTb2xpZE5FVCBEUFUgZHJpdmVyLgogICAgICB2aXJ0aW9fYmxr
OiBhZGQgVklSVElPX0JMS19GX0xJRkVUSU1FIGZlYXR1cmUgc3VwcG9ydAogICAgICB2aXJ0aW86
IHZkcGE6IGZpeCBzbnByaW50ZiBzaXplIGFyZ3VtZW50IGluIHNuZXRfdmRwYSBkcml2ZXIKCkFu
Z3VzIENoZW4gKDIpOgogICAgICB2aXJ0aW9fcGNpOiBtb2RpZnkgRU5PRU5UIHRvIEVJTlZBTAog
ICAgICB2aXJ0aW9fYmxrOiB1c2UgVUlOVF9NQVggaW5zdGVhZCBvZiAtMVUKCkJvYmJ5IEVzaGxl
bWFuICgxKToKICAgICAgdmlydGlvL3Zzb2NrOiByZXBsYWNlIHZpcnRpb192c29ja19wa3Qgd2l0
aCBza19idWZmCgpDaW5keSBMdSAoMik6CiAgICAgIHZob3N0X3ZkcGE6IGZpeCB0aGUgY3Jhc2gg
aW4gdW5tYXAgYSBsYXJnZSBtZW1vcnkKICAgICAgdmRwYV9zaW1fbmV0OiBzaG91bGQgbm90IGRy
b3AgdGhlIG11bHRpY2FzdC9icm9hZGNhc3QgcGFja2V0CgpDb2xpbiBJYW4gS2luZyAoMSk6CiAg
ICAgIFJETUEvbWx4NTogcmVtb3ZlIHZhcmlhYmxlIGkKCkRhdmlkbG9ociBCdWVzbyAoMik6CiAg
ICAgIHRvb2xzL3ZpcnRpbzogcmVtb3ZlIHN0cmF5IGNoYXJhY3RlcnMKICAgICAgdG9vbHMvdmly
dGlvOiByZW1vdmUgc21wX3JlYWRfYmFycmllcl9kZXBlbmRzKCkKCkRhd2VpIExpICgxKToKICAg
ICAgdmlydGlvOiBJbXBsZW1lbnRpbmcgYXR0cmlidXRlIHNob3cgd2l0aCBzeXNmc19lbWl0CgpE
bWl0cnkgRm9taWNoZXYgKDIpOgogICAgICB2aXJ0aW8tYmxrOiB1c2UgYSBoZWxwZXIgdG8gaGFu
ZGxlIHJlcXVlc3QgcXVldWluZyBlcnJvcnMKICAgICAgdmlydGlvLWJsazogYWRkIHN1cHBvcnQg
Zm9yIHpvbmVkIGJsb2NrIGRldmljZXMKCkVsaSBDb2hlbiAoOCk6CiAgICAgIHZkcGEvbWx4NTog
Rml4IHJ1bGUgZm9yd2FyZGluZyBWTEFOIHRvIFRJUgogICAgICB2ZHBhL21seDU6IFJldHVybiBl
cnJvciBvbiB2bGFuIGN0cmwgY29tbWFuZHMgaWYgbm90IHN1cHBvcnRlZAogICAgICB2ZHBhL21s
eDU6IEZpeCB3cm9uZyBtYWMgYWRkcmVzcyBkZWxldGlvbgogICAgICB2ZHBhL21seDU6IEF2b2lk
IHVzaW5nIHJlc2xvY2sgaW4gZXZlbnRfaGFuZGxlcgogICAgICB2ZHBhL21seDU6IEF2b2lkIG92
ZXJ3cml0aW5nIENWUSBpb3RsYgogICAgICB2ZHBhL21seDU6IE1vdmUgc29tZSBkZWZpbml0aW9u
cyB0byBhIG5ldyBoZWFkZXIgZmlsZQogICAgICB2ZHBhL21seDU6IEFkZCBkZWJ1Z2ZzIHN1YnRy
ZWUKICAgICAgdmRwYS9tbHg1OiBBZGQgUlggY291bnRlcnMgdG8gZGVidWdmcwoKRXVnZW5pbyBQ
w6lyZXogKDEpOgogICAgICB2ZHBhX3NpbV9uZXQ6IE9mZmVyIFZJUlRJT19ORVRfRl9TVEFUVVMK
CkhhcnNoaXQgTW9nYWxhcGFsbGkgKDEpOgogICAgICB2ZHVzZTogVmFsaWRhdGUgdnFfbnVtIGlu
IHZkdXNlX3ZhbGlkYXRlX2NvbmZpZygpCgpKYXNvbiBXYW5nICgyKToKICAgICAgdmRwYTogY29u
ZGl0aW9uYWxseSBmaWxsIG1heCBtYXggcXVldWUgcGFpciBmb3Igc3RhdHMKICAgICAgdmRwYXNp
bTogZml4IG1lbW9yeSBsZWFrIHdoZW4gZnJlZWluZyBJT1RMQnMKCk1pY2hhZWwgUy4gVHNpcmtp
biAoMyk6CiAgICAgIHZpcnRpb19ibGs6IHRlbXBvcmFyeSB2YXJpYWJsZSB0eXBlIHR3ZWFrCiAg
ICAgIHZpcnRpb19ibGs6IHpvbmUgYXBwZW5kIGluIGhlYWRlciB0eXBlIHR3ZWFrCiAgICAgIHZp
cnRpb19ibGs6IG1hcmsgYWxsIHpvbmUgZmllbGRzIExFCgpNaWNoYWVsIFNhbW1sZXIgKDEpOgog
ICAgICB2aXJ0aW9fcG1lbTogcG9wdWxhdGUgbnVtYSBpbmZvcm1hdGlvbgoKUmFmYWVsIE1lbmRv
bmNhICgxKToKICAgICAgdmlydGlvX2JsazogRml4IHNpZ25lZG5lc3MgYnVnIGluIHZpcnRibGtf
cHJlcF9ycSgpCgpSaWNhcmRvIENhw7F1ZWxvICgyKToKICAgICAgdG9vbHMvdmlydGlvOiBpbml0
aWFsaXplIHNwaW5sb2NrcyBpbiB2cmluZ190ZXN0LmMKICAgICAgZG9jczogZHJpdmVyLWFwaTog
dmlydGlvOiB2aXJ0aW8gb24gTGludXgKClJvbmcgV2FuZyAoMSk6CiAgICAgIHZkcGEvdnBfdmRw
YTogZml4IGtmcmVlIGEgd3JvbmcgcG9pbnRlciBpbiB2cF92ZHBhX3JlbW92ZQoKU2hhb21pbiBE
ZW5nICgxKToKICAgICAgdG9vbHM6IERlbGV0ZSB0aGUgdW5uZWVkZWQgc2VtaWNvbG9uIGFmdGVy
IGN1cmx5IGJyYWNlcwoKU2hhb3FpbiBIdWFuZyAoMik6CiAgICAgIHZpcnRpb19wY2k6IHVzZSBo
ZWxwZXIgZnVuY3Rpb24gaXNfcG93ZXJfb2ZfMigpCiAgICAgIHZpcnRpb19yaW5nOiB1c2UgaGVs
cGVyIGZ1bmN0aW9uIGlzX3Bvd2VyX29mXzIoKQoKU2ktV2VpIExpdSAoMSk6CiAgICAgIHZkcGE6
IG1lcmdlIGZ1bmN0aW9uYWxseSBkdXBsaWNhdGVkIGRldl9mZWF0dXJlcyBhdHRyaWJ1dGVzCgpT
dGVmYW5vIEdhcnphcmVsbGEgKDQpOgogICAgICB2cmluZ2g6IGZpeCByYW5nZSB1c2VkIGluIGlv
dGxiX3RyYW5zbGF0ZSgpCiAgICAgIHZob3N0OiBmaXggcmFuZ2UgdXNlZCBpbiB0cmFuc2xhdGVf
ZGVzYygpCiAgICAgIHZob3N0LXZkcGE6IGZpeCBhbiBpb3RsYiBtZW1vcnkgbGVhawogICAgICB2
ZHBhX3NpbTogZml4IHZyaW5naCBpbml0aWFsaXphdGlvbiBpbiB2ZHBhc2ltX3F1ZXVlX3JlYWR5
KCkKCldlaSBZb25nanVuICgxKToKICAgICAgdmlydGlvLWNyeXB0bzogZml4IG1lbW9yeSBsZWFr
IGluIHZpcnRpb19jcnlwdG9fYWxnX3NrY2lwaGVyX2Nsb3NlX3Nlc3Npb24oKQoKWXVhbiBDYW4g
KDEpOgogICAgICB2aG9zdC92c29jazogRml4IGVycm9yIGhhbmRsaW5nIGluIHZob3N0X3Zzb2Nr
X2luaXQoKQoKWmh1IExpbmdzaGFuICgxMik6CiAgICAgIHZEUEEvaWZjdmY6IGRlY291cGxlIGh3
IGZlYXR1cmVzIG1hbmlwdWxhdG9ycyBmcm9tIHRoZSBhZGFwdGVyCiAgICAgIHZEUEEvaWZjdmY6
IGRlY291cGxlIGNvbmZpZyBzcGFjZSBvcHMgZnJvbSB0aGUgYWRhcHRlcgogICAgICB2RFBBL2lm
Y3ZmOiBhbGxvYyB0aGUgbWdtdF9kZXYgYmVmb3JlIHRoZSBhZGFwdGVyCiAgICAgIHZEUEEvaWZj
dmY6IGRlY291cGxlIHZxIElSUSByZWxlYXNlcnMgZnJvbSB0aGUgYWRhcHRlcgogICAgICB2RFBB
L2lmY3ZmOiBkZWNvdXBsZSBjb25maWcgSVJRIHJlbGVhc2VyIGZyb20gdGhlIGFkYXB0ZXIKICAg
ICAgdkRQQS9pZmN2ZjogZGVjb3VwbGUgdnEgaXJxIHJlcXVlc3RlciBmcm9tIHRoZSBhZGFwdGVy
CiAgICAgIHZEUEEvaWZjdmY6IGRlY291cGxlIGNvbmZpZy9kZXYgSVJRIHJlcXVlc3RlciBhbmQg
dmVjdG9ycyBhbGxvY2F0b3IgZnJvbSB0aGUgYWRhcHRlcgogICAgICB2RFBBL2lmY3ZmOiBpZmN2
Zl9yZXF1ZXN0X2lycSB3b3JrcyBvbiBpZmN2Zl9odwogICAgICB2RFBBL2lmY3ZmOiBtYW5hZ2Ug
aWZjdmZfaHcgaW4gdGhlIG1nbXRfZGV2CiAgICAgIHZEUEEvaWZjdmY6IGFsbG9jYXRlIHRoZSBh
ZGFwdGVyIGluIGRldl9hZGQoKQogICAgICB2RFBBL2lmY3ZmOiByZXRpcmUgaWZjdmZfcHJpdmF0
ZV90b192ZgogICAgICB2RFBBL2lmY3ZmOiBpbXBsZW1lbnQgZmVhdHVyZXMgcHJvdmlzaW9uaW5n
CgpydWFuamluamllICgxKToKICAgICAgdmRwYV9zaW06IGZpeCBwb3NzaWJsZSBtZW1vcnkgbGVh
ayBpbiB2ZHBhc2ltX25ldF9pbml0KCkgYW5kIHZkcGFzaW1fYmxrX2luaXQoKQoKd2FuZ2ppYW5s
aSAoMSk6CiAgICAgIHRvb2xzL3ZpcnRpbzogVmFyaWFibGUgdHlwZSBjb21wbGV0aW9uCgogRG9j
dW1lbnRhdGlvbi9kcml2ZXItYXBpL2luZGV4LnJzdCAgICAgICAgICAgICAgICAgfCAgICAxICsK
IERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92aXJ0aW8vaW5kZXgucnN0ICAgICAgICAgIHwgICAx
MSArCiBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmlydGlvL3ZpcnRpby5yc3QgICAgICAgICB8
ICAxNDQgKysrCiAuLi4vZHJpdmVyLWFwaS92aXJ0aW8vd3JpdGluZ192aXJ0aW9fZHJpdmVycy5y
c3QgICB8ICAxOTcgKysrKwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgICA2ICsKIGRyaXZlcnMvYmxvY2svdmlydGlvX2Jsay5jICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDUyMiArKysrKysrKy0KIC4uLi9jcnlwdG8vdmlydGlvL3ZpcnRp
b19jcnlwdG9fc2tjaXBoZXJfYWxncy5jICAgIHwgICAgMyArLQogZHJpdmVycy9udmRpbW0vdmly
dGlvX3BtZW0uYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDExICstCiBkcml2ZXJzL3BjaS9x
dWlya3MuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDggKwogZHJpdmVycy92
ZHBhL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIyICsKIGRyaXZl
cnMvdmRwYS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSArCiBk
cml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5jICAgICAgICAgICAgICAgICAgICB8ICAgMzIg
Ky0KIGRyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmggICAgICAgICAgICAgICAgICAgIHwg
ICAxMCArLQogZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyAgICAgICAgICAgICAgICAg
ICAgfCAgMTYyICsrLQogZHJpdmVycy92ZHBhL21seDUvTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgICAyICstCiBkcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21seDVfdmRwYS5oICAg
ICAgICAgICAgICAgICB8ICAgIDUgKy0KIGRyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbXIuYyAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICA0NiArLQogZHJpdmVycy92ZHBhL21seDUvbmV0L2RlYnVn
LmMgICAgICAgICAgICAgICAgICAgICAgfCAgMTUyICsrKwogZHJpdmVycy92ZHBhL21seDUvbmV0
L21seDVfdm5ldC5jICAgICAgICAgICAgICAgICAgfCAgMjUyICsrKy0tCiBkcml2ZXJzL3ZkcGEv
bWx4NS9uZXQvbWx4NV92bmV0LmggICAgICAgICAgICAgICAgICB8ICAgOTQgKysKIGRyaXZlcnMv
dmRwYS9zb2xpZHJ1bi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAgNiArCiBkcml2
ZXJzL3ZkcGEvc29saWRydW4vc25ldF9od21vbi5jICAgICAgICAgICAgICAgICB8ICAxODggKysr
KwogZHJpdmVycy92ZHBhL3NvbGlkcnVuL3NuZXRfbWFpbi5jICAgICAgICAgICAgICAgICAgfCAx
MTExICsrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL3ZkcGEvc29saWRydW4vc25ldF92ZHBh
LmggICAgICAgICAgICAgICAgICB8ICAxOTYgKysrKwogZHJpdmVycy92ZHBhL3ZkcGEuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDExICstCiBkcml2ZXJzL3ZkcGEvdmRwYV9z
aW0vdmRwYV9zaW0uYyAgICAgICAgICAgICAgICAgICB8ICAgIDcgKy0KIGRyaXZlcnMvdmRwYS92
ZHBhX3NpbS92ZHBhX3NpbV9ibGsuYyAgICAgICAgICAgICAgIHwgICAgNCArLQogZHJpdmVycy92
ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltX25ldC5jICAgICAgICAgICAgICAgfCAgICA4ICstCiBkcml2
ZXJzL3ZkcGEvdmRwYV91c2VyL3ZkdXNlX2Rldi5jICAgICAgICAgICAgICAgICB8ICAgIDMgKwog
ZHJpdmVycy92ZHBhL3ZpcnRpb19wY2kvdnBfdmRwYS5jICAgICAgICAgICAgICAgICAgfCAgICAy
ICstCiBkcml2ZXJzL3Zob3N0L3ZkcGEuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgNTIgKy0KIGRyaXZlcnMvdmhvc3Qvdmhvc3QuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAgNCArLQogZHJpdmVycy92aG9zdC92cmluZ2guYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgICA1ICstCiBkcml2ZXJzL3Zob3N0L3Zzb2NrLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyMjQgKystLQogZHJpdmVycy92aXJ0aW8vdmlydGlvLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDEyICstCiBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNp
X21vZGVybi5jICAgICAgICAgICAgICAgICB8ICAgIDQgKy0KIGRyaXZlcnMvdmlydGlvL3ZpcnRp
b19yaW5nLmMgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMiArLQogaW5jbHVkZS9saW51eC9w
Y2lfaWRzLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAyICsKIGluY2x1ZGUvbGlu
dXgvdmlydGlvX2NvbmZpZy5oICAgICAgICAgICAgICAgICAgICAgIHwgICAgOCArLQogaW5jbHVk
ZS9saW51eC92aXJ0aW9fdnNvY2suaCAgICAgICAgICAgICAgICAgICAgICAgfCAgMTI2ICsrLQog
aW5jbHVkZS91YXBpL2xpbnV4L3ZkcGEuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA0
ICstCiBpbmNsdWRlL3VhcGkvbGludXgvdmlydGlvX2Jsay5oICAgICAgICAgICAgICAgICAgICB8
ICAxMzMgKysrCiBpbmNsdWRlL3VhcGkvbGludXgvdmlydGlvX2Jsa19pb2N0bC5oICAgICAgICAg
ICAgICB8ICAgNDQgKwogbmV0L3Ztd192c29jay92aXJ0aW9fdHJhbnNwb3J0LmMgICAgICAgICAg
ICAgICAgICAgfCAgMTQ5ICstLQogbmV0L3Ztd192c29jay92aXJ0aW9fdHJhbnNwb3J0X2NvbW1v
bi5jICAgICAgICAgICAgfCAgNDIwICsrKystLS0tCiBuZXQvdm13X3Zzb2NrL3Zzb2NrX2xvb3Bi
YWNrLmMgICAgICAgICAgICAgICAgICAgICB8ICAgNTEgKy0KIHRvb2xzL3ZpcnRpby9yaW5ndGVz
dC9tYWluLmggICAgICAgICAgICAgICAgICAgICAgIHwgICAzNyArLQogdG9vbHMvdmlydGlvL3Zp
cnRpby10cmFjZS90cmFjZS1hZ2VudC1jdGwuYyAgICAgICAgfCAgICAyICstCiB0b29scy92aXJ0
aW8vdmlydGlvX3Rlc3QuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKy0KIHRvb2xz
L3ZpcnRpby92cmluZ2hfdGVzdC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMiArCiA1
MCBmaWxlcyBjaGFuZ2VkLCAzNjYxIGluc2VydGlvbnMoKyksIDgzOSBkZWxldGlvbnMoLSkKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvdmlydGlvL2luZGV4LnJz
dAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92aXJ0aW8vdmly
dGlvLnJzdAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92aXJ0
aW8vd3JpdGluZ192aXJ0aW9fZHJpdmVycy5yc3QKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L3ZkcGEvbWx4NS9uZXQvZGVidWcuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmRwYS9t
bHg1L25ldC9tbHg1X3ZuZXQuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmRwYS9zb2xp
ZHJ1bi9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmRwYS9zb2xpZHJ1bi9z
bmV0X2h3bW9uLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZkcGEvc29saWRydW4vc25l
dF9tYWluLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZkcGEvc29saWRydW4vc25ldF92
ZHBhLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3VhcGkvbGludXgvdmlydGlvX2Jsa19p
b2N0bC5oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
