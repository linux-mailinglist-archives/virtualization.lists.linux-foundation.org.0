Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 868D31A8526
	for <lists.virtualization@lfdr.de>; Tue, 14 Apr 2020 18:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2F987859BA;
	Tue, 14 Apr 2020 16:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k0iSbLpvhOHR; Tue, 14 Apr 2020 16:36:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E07385913;
	Tue, 14 Apr 2020 16:36:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 763BDC0172;
	Tue, 14 Apr 2020 16:36:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A703C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6460C86CE1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tC26CuaANVPe
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:36:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9D0B183FA2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586882188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bma9lzqspxl+HaX8bOFBirR9lSGp5CwUCJdb2i/e18Q=;
 b=W6PoqjIiTcvw2lY8JEYY5zgyHlbHqvzy0d2vDnNtq9U0McX36i7COWXWMGdkyukkcSHrqJ
 hej87vy5iQz8TlPkY4tG+TzT11qGk1Zo4qesJ1/SZPYn37F25FGGwRUzbFSLRmqvPAaQtr
 9ieZ49mQ4TXPaKUcBjD0wLrhzhC3thM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-MaT5vRnhPAqNvwkmfPcjyg-1; Tue, 14 Apr 2020 12:36:12 -0400
X-MC-Unique: MaT5vRnhPAqNvwkmfPcjyg-1
Received: by mail-qv1-f69.google.com with SMTP id m20so307403qvy.13
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 09:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=Bma9lzqspxl+HaX8bOFBirR9lSGp5CwUCJdb2i/e18Q=;
 b=eb4rJHZiCdkP4vOCXFdIqyC/80Xfb+8VQ6ooRx/BKu0wwW81mQfFomQv4z30+8BHpj
 va2ecy20AZnEJLGyt2/fcGYtxpJcK2y+GiXfY4D6sE4UOEB4I72iicObBK8EXZvS+kBM
 r/BKqBbVV60DxKtvHcfN5lO95HfuqTxl/ooRKR5hQkgVgGIA6F7+Ru0hs6jfzvwGlX+3
 W5yDW//erfT4JT6uyQUaNwNiP03JTw9pv4rX4SsdRuX/3sy9ucbik4CdloMUgHrisDo8
 oFugQ5mEJu3myAhP4A92MUVdgXzMB6tiVLiV+EnzlvSyBQP0zCJq9Gx0ySTFfrpmFYvr
 FeWg==
X-Gm-Message-State: AGi0Pub/Hzd1olbaa5mDpLtwN7JANO5MzinEvfL/g5gLqf2AMY3Ci15B
 Ol5W3Qy5Zt8ekHqV9jub0G8m9aQKPBLzgeuXKGdNQQtVrm6tPhtIo2oTWa7lXXSSCT4PxfUm7j9
 9l9ADHs1hYPOb2h0JCH9l6OLQzxmM9fUSxKj9npGbeQ==
X-Received: by 2002:aed:3968:: with SMTP id l95mr17285855qte.268.1586882172267; 
 Tue, 14 Apr 2020 09:36:12 -0700 (PDT)
X-Google-Smtp-Source: APiQypJmGmy3GlXUch/z8/x+Ns406G7xQ35JzF4VsBJ4waQC3oBq6dZNWOjBqM2wZ8BVLIAkuD0c8Q==
X-Received: by 2002:aed:3968:: with SMTP id l95mr17285823qte.268.1586882171965; 
 Tue, 14 Apr 2020 09:36:11 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id u126sm10933237qkh.66.2020.04.14.09.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 09:36:11 -0700 (PDT)
Date: Tue, 14 Apr 2020 12:36:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] vhost: cleanups and fixes
Message-ID: <20200414123606-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: hulkci@huawei.com, matej.genci@nutanix.com, kvm@vger.kernel.org,
 arnd@arndb.de, gustavo@embeddedor.com, netdev@vger.kernel.org, mst@redhat.com,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, ashutosh.dixit@intel.com,
 eperezma@redhat.com, andy.shevchenko@gmail.com, yanaijie@huawei.com,
 eli@mellanox.com, sfr@canb.auug.org.au, bjorn.andersson@linaro.org,
 elfring@users.sourceforge.net
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA4MzVhNmE2NDlkMGRkMWIxZjQ2NzU5
ZWI2MGZmZjJmNjNlZDI1M2E3OgoKICB2aXJ0aW8tYmFsbG9vbjogUmV2ZXJ0ICJ2aXJ0aW8tYmFs
bG9vbjogU3dpdGNoIGJhY2sgdG8gT09NIGhhbmRsZXIgZm9yIFZJUlRJT19CQUxMT09OX0ZfREVG
TEFURV9PTl9PT00iICgyMDIwLTA0LTA3IDA1OjQ0OjU3IC0wNDAwKQoKYXJlIGF2YWlsYWJsZSBp
biB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L21zdC92aG9zdC5naXQgdGFncy9mb3JfbGludXMKCmZvciB5b3Ug
dG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBkNGE4NWMyYWNlODk1YTU4ZGNhYjY4N2ZmNDljNzY3MTkw
MTFmNThkOgoKICB2ZHBhOiBmaXggY29tbWVudCBvZiB2ZHBhX3JlZ2lzdGVyX2RldmljZSgpICgy
MDIwLTA0LTEzIDA3OjE2OjQxIC0wNDAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQp2aXJ0aW86IGZpeGVzLCBjbGVhbnVw
cwoKU29tZSBidWcgZml4ZXMuCkNsZWFudXAgYSBjb3VwbGUgb2YgaXNzdWVzIHRoYXQgc3VyZmFj
ZWQgbWVhbndoaWxlLgoKU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVk
aGF0LmNvbT4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KRXVnZW5pbyBQw6lyZXogKDQpOgogICAgICB2aG9zdDogQ3JlYXRl
IGFjY2Vzc29ycyBmb3IgdmlydHF1ZXVlcyBwcml2YXRlX2RhdGEKICAgICAgdG9vbHMvdmlydGlv
OiBBZGQgLS1iYXRjaCBvcHRpb24KICAgICAgdG9vbHMvdmlydGlvOiBBZGQgLS1iYXRjaD1yYW5k
b20gb3B0aW9uCiAgICAgIHRvb2xzL3ZpcnRpbzogQWRkIC0tcmVzZXQ9cmFuZG9tCgpHdXN0YXZv
IEEuIFIuIFNpbHZhICgxKToKICAgICAgdmhvc3Q6IHZkcGE6IHJlbW92ZSB1bm5lY2Vzc2FyeSBu
dWxsIGNoZWNrCgpKYXNvbiBXYW5nICgxKToKICAgICAgdmRwYTogZml4IGNvbW1lbnQgb2YgdmRw
YV9yZWdpc3Rlcl9kZXZpY2UoKQoKSmFzb24gWWFuICgxKToKICAgICAgdmhvc3Q6IHJlbW92ZSBz
ZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICdzdGF0dXMnCgpNYXJrdXMgRWxmcmluZyAoMSk6CiAg
ICAgIHZpcnRpby1tbWlvOiBEZWxldGUgYW4gZXJyb3IgbWVzc2FnZSBpbiB2bV9maW5kX3Zxcygp
CgpNYXRlaiBHZW5jaSAoMSk6CiAgICAgIHZpcnRpbzogYWRkIFZJUlRJT19SSU5HX05PX0xFR0FD
WQoKTWljaGFlbCBTLiBUc2lya2luICgyMik6CiAgICAgIHZkcGEtc2ltOiBkZXBlbmQgb24gSEFT
X0RNQQogICAgICB2aXJ0aW8vdGVzdDogZml4IHVwIGFmdGVyIElPVExCIGNoYW5nZXMKICAgICAg
dmhvc3Q6IGRyb3AgdnJpbmcgZGVwZW5kZW5jeSBvbiBpb3RsYgogICAgICB0b29scy92aXJ0aW86
IGRlZmluZSBhbGlnbmVkIGF0dHJpYnV0ZQogICAgICB0b29scy92aXJ0aW86IG1ha2UgYXNtL2Jh
cnJpZXIuaCBzZWxmIGNvbnRhaW5lZAogICAgICB0b29scy92aXJ0aW86IGRlZmluZSBfX0tFUk5F
TF9fCiAgICAgIHZpcnRncHU6IHB1bGwgaW4gdWFjY2Vzcy5oCiAgICAgIHZpcnRpby1ybmc6IHB1
bGwgaW4gc2xhYi5oCiAgICAgIHJlbW90ZXByb2M6IHB1bGwgaW4gc2xhYi5oCiAgICAgIHZpcnRp
b19pbnB1dDogcHVsbCBpbiBzbGFiLmgKICAgICAgcnBtc2c6IHB1bGwgaW4gc2xhYi5oCiAgICAg
IHJlbW90ZXByb2M6IHB1bGwgaW4gc2xhYi5oCiAgICAgIHZpcnRpbzogc3RvcCB1c2luZyBsZWdh
Y3kgc3RydWN0IHZyaW5nIGluIGtlcm5lbAogICAgICB2aG9zdDogZm9yY2Ugc3BlYyBzcGVjaWZp
ZWQgYWxpZ25tZW50IG9uIHR5cGVzCiAgICAgIHZpcnRpbzogYWRkIGxlZ2FjeSBpbml0L3NpemUg
QVBJcwogICAgICB2aXJ0aW9fcmluZzogc3dpdGNoIHRvIHZpcnRpb19sZWdhY3lfaW5pdC9zaXpl
CiAgICAgIHRvb2xzL3ZpcnRpbzogc3dpdGNoIHRvIHZpcnRpb19sZWdhY3lfaW5pdC9zaXplCiAg
ICAgIHZvcDogc3dpdGNoIHRvIHZpcnRpb19sZWdhY3lfaW5pdC9zaXplCiAgICAgIHJlbW90ZXBy
b2M6IHN3aXRjaCB0byB2aXJ0aW9fbGVnYWN5X2luaXQvc2l6ZQogICAgICBtZWxsYW5veDogc3dp
dGNoIHRvIHZpcnRpb19sZWdhY3lfaW5pdC9zaXplCiAgICAgIHZkcGE6IGFsbG93IGEgMzIgYml0
IHZxIGFsaWdubWVudAogICAgICB2ZHBhOiBtYWtlIHZob3N0LCB2aXJ0aW8gZGVwZW5kIG9uIG1l
bnUKClN0ZXBoZW4gUm90aHdlbGwgKDEpOgogICAgICBkcm0vdmlydGlvOiBmaXggdXAgZm9yIGlu
Y2x1ZGUgZmlsZSBjaGFuZ2VzCgpZdWVIYWliaW5nICgyKToKICAgICAgdmRwYTogcmVtb3ZlIHVu
dXNlZCB2YXJpYWJsZXMgJ2lmY3ZmJyBhbmQgJ2lmY3ZmX2xtJwogICAgICB2ZHBhc2ltOiBSZXR1
cm4gc3RhdHVzIGluIHZkcGFzaW1fZ2V0X3N0YXR1cwoKIGRyaXZlcnMvYmxvY2svdmlydGlvX2Js
ay5jICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9jaGFyL2h3X3JhbmRvbS92aXJ0aW8t
cm5nLmMgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwu
YyAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYyAgICAgfCAg
IDEgKwogZHJpdmVycy9taXNjL21pYy92b3Avdm9wX21haW4uYyAgICAgICAgICB8ICAgNSArLQog
ZHJpdmVycy9taXNjL21pYy92b3Avdm9wX3ZyaW5naC5jICAgICAgICB8ICAgOCArKy0KIGRyaXZl
cnMvcGxhdGZvcm0vbWVsbGFub3gvbWx4YmYtdG1maWZvLmMgfCAgIDYgKy0KIGRyaXZlcnMvcmVt
b3RlcHJvYy9yZW1vdGVwcm9jX2NvcmUuYyAgICAgfCAgIDIgKy0KIGRyaXZlcnMvcmVtb3RlcHJv
Yy9yZW1vdGVwcm9jX3N5c2ZzLmMgICAgfCAgIDEgKwogZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90
ZXByb2NfdmlydGlvLmMgICB8ICAgMiArLQogZHJpdmVycy9yZW1vdGVwcm9jL3N0bTMyX3Jwcm9j
LmMgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3JwbXNnL210a19ycG1zZy5jICAgICAgICAgICAg
ICAgIHwgICAxICsKIGRyaXZlcnMvdmRwYS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAg
MTkgKysrLS0tCiBkcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5jICAgICAgICAgIHwgICAy
IC0KIGRyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMgICAgICAgICAgfCAgIDQgKy0KIGRy
aXZlcnMvdmRwYS92ZHBhLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMv
dmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jICAgICAgICAgfCAgIDQgKy0KIGRyaXZlcnMvdmhvc3Qv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KIGRyaXZlcnMvdmhvc3QvbmV0LmMg
ICAgICAgICAgICAgICAgICAgICAgfCAgMjggKysrKystLS0tCiBkcml2ZXJzL3Zob3N0L3Njc2ku
YyAgICAgICAgICAgICAgICAgICAgIHwgIDE0ICsrLS0tCiBkcml2ZXJzL3Zob3N0L3Rlc3QuYyAg
ICAgICAgICAgICAgICAgICAgIHwgIDcxICsrKysrKysrKysrKysrKysrKystLS0KIGRyaXZlcnMv
dmhvc3QvdGVzdC5oICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy92aG9zdC92
ZHBhLmMgICAgICAgICAgICAgICAgICAgICB8ICAgNSAtLQogZHJpdmVycy92aG9zdC92aG9zdC5o
ICAgICAgICAgICAgICAgICAgICB8ICAzMyArKysrKysrKystCiBkcml2ZXJzL3Zob3N0L3ZyaW5n
aC5jICAgICAgICAgICAgICAgICAgIHwgICA1ICsrCiBkcml2ZXJzL3Zob3N0L3Zzb2NrLmMgICAg
ICAgICAgICAgICAgICAgIHwgIDE0ICsrLS0tCiBkcml2ZXJzL3ZpcnRpby9LY29uZmlnICAgICAg
ICAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL3ZpcnRpby92aXJ0aW9faW5wdXQuYyAgICAg
ICAgICAgIHwgICAxICsKIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19tbWlvLmMgICAgICAgICAgICAg
fCAgIDQgKy0KIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19wY2lfbW9kZXJuLmMgICAgICAgfCAgIDEg
KwogZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYyAgICAgICAgICAgICB8ICAxNSArKystLQog
aW5jbHVkZS9saW51eC92ZHBhLmggICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogaW5jbHVk
ZS9saW51eC92aXJ0aW8uaCAgICAgICAgICAgICAgICAgICB8ICAgMSAtCiBpbmNsdWRlL2xpbnV4
L3ZpcnRpb19yaW5nLmggICAgICAgICAgICAgIHwgIDQ2ICsrKysrKysrKysrKysrCiBpbmNsdWRl
L2xpbnV4L3ZyaW5naC5oICAgICAgICAgICAgICAgICAgIHwgICA3ICsrKwogaW5jbHVkZS91YXBp
L2xpbnV4L3ZpcnRpb19yaW5nLmggICAgICAgICB8ICAzMCArKysrKystLS0KIHRvb2xzL3ZpcnRp
by9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KIHRvb2xzL3ZpcnRpby9hc20v
YmFycmllci5oICAgICAgICAgICAgICAgfCAgIDEgKwogdG9vbHMvdmlydGlvL2dlbmVyYXRlZC9h
dXRvY29uZi5oICAgICAgICB8ICAgMAogdG9vbHMvdmlydGlvL2xpbnV4L2NvbXBpbGVyLmggICAg
ICAgICAgICB8ICAgMSArCiB0b29scy92aXJ0aW8vcmluZ3Rlc3QvdmlydGlvX3JpbmdfMF85LmMg
IHwgICA2ICstCiB0b29scy92aXJ0aW8vdmlydGlvX3Rlc3QuYyAgICAgICAgICAgICAgIHwgMTAx
ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIHRvb2xzL3ZpcnRpby92cmluZ2hfdGVz
dC5jICAgICAgICAgICAgICAgfCAgMTggKysrLS0tCiA0MyBmaWxlcyBjaGFuZ2VkLCAzNTQgaW5z
ZXJ0aW9ucygrKSwgMTI0IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Zp
cnRpby9nZW5lcmF0ZWQvYXV0b2NvbmYuaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
