Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 671015021C3
	for <lists.virtualization@lfdr.de>; Fri, 15 Apr 2022 06:54:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12F07819D1;
	Fri, 15 Apr 2022 04:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H7pT5pojtwZw; Fri, 15 Apr 2022 04:54:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 81ACC81298;
	Fri, 15 Apr 2022 04:54:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12611C0085;
	Fri, 15 Apr 2022 04:54:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAD56C002C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 04:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8C58819D1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 04:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q9q-AxyNQyJH
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 04:54:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9DB8817D3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 04:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=CzPLS+Gjxb/zoXdxVG3wb1X+zPEYuY3a71fFFzUQsIo=; b=PxTC6KnciQw0TSk9vI+K+AMZhB
 u9e+Rsg6/gEELi9/+U/v63dpyvw0hUtfHyPU16IZS1Eodmr5X+cu2FRmZWSzJpe+KZhaB8WPX73iy
 c6TK87vBkvMsokVjnVkLP6p7ua2/nu4iRHseV7k8Otwf/q7lwy6z7apWU+n+IP1iUvyEzbauM7lCp
 dkSj+aQUOppSdadfxst8W0LcrS+Mm/D+yrRNvKalP/J5Dfogq3zfiOEumpJYUHKnW8QvLxDGWbnNa
 GemfPfulsMzUnykcCOMbb7hTYIQIE4W/va/oe9dQyCoWo0AOAT691zcccidiP4Ae970vBl8VgjIPB
 +dTJ1dFw==;
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDyG-008PgP-Ki; Fri, 15 Apr 2022 04:54:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 23/27] block: add a bdev_max_discard_sectors helper
Date: Fri, 15 Apr 2022 06:52:54 +0200
Message-Id: <20220415045258.199825-24-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220415045258.199825-1-hch@lst.de>
References: <20220415045258.199825-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, ceph-devel@vger.kernel.org,
 Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
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

QWRkIGEgaGVscGVyIHRvIHF1ZXJ5IHRoZSBudW1iZXIgb2Ygc2VjdG9ycyBzdXBwb3J0IHBlciBl
YWNoIGRpc2NhcmQgYmlvCmJhc2VkIG9uIHRoZSBibG9jayBkZXZpY2UgYW5kIHVzZSB0aGlzIGhl
bHBlciB0byBzdG9wIHZhcmlvdXMgcGxhY2VzIGZyb20KcG9raW5nIGludG8gdGhlIHJlcXVlc3Rf
cXVldWUgdG8gc2VlIGlmIGRpc2NhcmQgaXMgc3VwcG9ydGVkIGFuZCBpZiBzbyBob3cKbXVjaC4g
IFRoaXMgbWlycm9ycyB3aGF0IGlzIGRvbmUgZS5nLiBmb3Igd3JpdGUgemVyb2VzIGFzIHdlbGwu
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3ZWQt
Ynk6IE1hcnRpbiBLLiBQZXRlcnNlbiA8bWFydGluLnBldGVyc2VuQG9yYWNsZS5jb20+CkFja2Vk
LWJ5OiBDaHJpc3RvcGggQsO2aG13YWxkZXIgPGNocmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQu
Y29tPiBbZHJiZF0KQWNrZWQtYnk6IENvbHkgTGkgPGNvbHlsaUBzdXNlLmRlPiBbYmNhY2hlXQpB
Y2tlZC1ieTogRGF2aWQgU3RlcmJhIDxkc3RlcmJhQHN1c2UuY29tPiBbYnRyZnNdCi0tLQogZHJp
dmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYyAgICAgICAgfCA4ICsrKysrLS0tCiBkcml2ZXJzL2Js
b2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jICB8IDIgKy0KIGRyaXZlcnMvYmxvY2svcm5iZC9ybmJk
LXNydi1kZXYuaCAgIHwgMyArLS0KIGRyaXZlcnMvbWQvZG0taW8uYyAgICAgICAgICAgICAgICAg
IHwgMiArLQogZHJpdmVycy90YXJnZXQvdGFyZ2V0X2NvcmVfZGV2aWNlLmMgfCA3ICsrKy0tLS0K
IGZzL2YyZnMvc2VnbWVudC5jICAgICAgICAgICAgICAgICAgIHwgNiArKy0tLS0KIGluY2x1ZGUv
bGludXgvYmxrZGV2LmggICAgICAgICAgICAgIHwgNSArKysrKwogNyBmaWxlcyBjaGFuZ2VkLCAx
OCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Js
b2NrL2RyYmQvZHJiZF9ubC5jIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYwppbmRleCA0
ZDAwOTg2ZDZmNTg4Li5hMGEwNmUyMzhlOTE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2Ry
YmQvZHJiZF9ubC5jCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMKQEAgLTE0Mzks
NyArMTQzOSw4IEBAIHN0YXRpYyBib29sIHdyaXRlX29yZGVyaW5nX2NoYW5nZWQoc3RydWN0IGRp
c2tfY29uZiAqYSwgc3RydWN0IGRpc2tfY29uZiAqYikKIHN0YXRpYyB2b2lkIHNhbml0aXplX2Rp
c2tfY29uZihzdHJ1Y3QgZHJiZF9kZXZpY2UgKmRldmljZSwgc3RydWN0IGRpc2tfY29uZiAqZGlz
a19jb25mLAogCQkJICAgICAgIHN0cnVjdCBkcmJkX2JhY2tpbmdfZGV2ICpuYmMpCiB7Ci0Jc3Ry
dWN0IHJlcXVlc3RfcXVldWUgKiBjb25zdCBxID0gbmJjLT5iYWNraW5nX2JkZXYtPmJkX2Rpc2st
PnF1ZXVlOworCXN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYgPSBuYmMtPmJhY2tpbmdfYmRldjsK
KwlzdHJ1Y3QgcmVxdWVzdF9xdWV1ZSAqcSA9IGJkZXYtPmJkX2Rpc2stPnF1ZXVlOwogCiAJaWYg
KGRpc2tfY29uZi0+YWxfZXh0ZW50cyA8IERSQkRfQUxfRVhURU5UU19NSU4pCiAJCWRpc2tfY29u
Zi0+YWxfZXh0ZW50cyA9IERSQkRfQUxfRVhURU5UU19NSU47CkBAIC0xNDU1LDYgKzE0NTYsNyBA
QCBzdGF0aWMgdm9pZCBzYW5pdGl6ZV9kaXNrX2NvbmYoc3RydWN0IGRyYmRfZGV2aWNlICpkZXZp
Y2UsIHN0cnVjdCBkaXNrX2NvbmYgKmRpcwogCiAJaWYgKGRpc2tfY29uZi0+cnNfZGlzY2FyZF9n
cmFudWxhcml0eSkgewogCQlpbnQgb3JpZ192YWx1ZSA9IGRpc2tfY29uZi0+cnNfZGlzY2FyZF9n
cmFudWxhcml0eTsKKwkJc2VjdG9yX3QgZGlzY2FyZF9zaXplID0gYmRldl9tYXhfZGlzY2FyZF9z
ZWN0b3JzKGJkZXYpIDw8IDk7CiAJCWludCByZW1haW5kZXI7CiAKIAkJaWYgKHEtPmxpbWl0cy5k
aXNjYXJkX2dyYW51bGFyaXR5ID4gZGlza19jb25mLT5yc19kaXNjYXJkX2dyYW51bGFyaXR5KQpA
QCAtMTQ2Myw4ICsxNDY1LDggQEAgc3RhdGljIHZvaWQgc2FuaXRpemVfZGlza19jb25mKHN0cnVj
dCBkcmJkX2RldmljZSAqZGV2aWNlLCBzdHJ1Y3QgZGlza19jb25mICpkaXMKIAkJcmVtYWluZGVy
ID0gZGlza19jb25mLT5yc19kaXNjYXJkX2dyYW51bGFyaXR5ICUgcS0+bGltaXRzLmRpc2NhcmRf
Z3JhbnVsYXJpdHk7CiAJCWRpc2tfY29uZi0+cnNfZGlzY2FyZF9ncmFudWxhcml0eSArPSByZW1h
aW5kZXI7CiAKLQkJaWYgKGRpc2tfY29uZi0+cnNfZGlzY2FyZF9ncmFudWxhcml0eSA+IHEtPmxp
bWl0cy5tYXhfZGlzY2FyZF9zZWN0b3JzIDw8IDkpCi0JCQlkaXNrX2NvbmYtPnJzX2Rpc2NhcmRf
Z3JhbnVsYXJpdHkgPSBxLT5saW1pdHMubWF4X2Rpc2NhcmRfc2VjdG9ycyA8PCA5OworCQlpZiAo
ZGlza19jb25mLT5yc19kaXNjYXJkX2dyYW51bGFyaXR5ID4gZGlzY2FyZF9zaXplKQorCQkJZGlz
a19jb25mLT5yc19kaXNjYXJkX2dyYW51bGFyaXR5ID0gZGlzY2FyZF9zaXplOwogCiAJCWlmIChk
aXNrX2NvbmYtPnJzX2Rpc2NhcmRfZ3JhbnVsYXJpdHkgIT0gb3JpZ192YWx1ZSkKIAkJCWRyYmRf
aW5mbyhkZXZpY2UsICJyc19kaXNjYXJkX2dyYW51bGFyaXR5IGNoYW5nZWQgdG8gJWRcbiIsCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jIGIvZHJpdmVycy9i
bG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYwppbmRleCAwOGRhOTIyZjgxZDFkLi4wYjRjN2RlNDYz
OTg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jCisrKyBi
L2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMKQEAgLTE1MjQsNyArMTUyNCw3IEBA
IGludCBkcmJkX2lzc3VlX2Rpc2NhcmRfb3JfemVyb19vdXQoc3RydWN0IGRyYmRfZGV2aWNlICpk
ZXZpY2UsIHNlY3Rvcl90IHN0YXJ0LCB1CiAJZ3JhbnVsYXJpdHkgPSBtYXgocS0+bGltaXRzLmRp
c2NhcmRfZ3JhbnVsYXJpdHkgPj4gOSwgMVUpOwogCWFsaWdubWVudCA9IChiZGV2X2Rpc2NhcmRf
YWxpZ25tZW50KGJkZXYpID4+IDkpICUgZ3JhbnVsYXJpdHk7CiAKLQltYXhfZGlzY2FyZF9zZWN0
b3JzID0gbWluKHEtPmxpbWl0cy5tYXhfZGlzY2FyZF9zZWN0b3JzLCAoMVUgPDwgMjIpKTsKKwlt
YXhfZGlzY2FyZF9zZWN0b3JzID0gbWluKGJkZXZfbWF4X2Rpc2NhcmRfc2VjdG9ycyhiZGV2KSwg
KDFVIDw8IDIyKSk7CiAJbWF4X2Rpc2NhcmRfc2VjdG9ycyAtPSBtYXhfZGlzY2FyZF9zZWN0b3Jz
ICUgZ3JhbnVsYXJpdHk7CiAJaWYgKHVubGlrZWx5KCFtYXhfZGlzY2FyZF9zZWN0b3JzKSkKIAkJ
Z290byB6ZXJvX291dDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svcm5iZC9ybmJkLXNydi1k
ZXYuaCBiL2RyaXZlcnMvYmxvY2svcm5iZC9ybmJkLXNydi1kZXYuaAppbmRleCAyYzNkZjAyYjVl
OGVjLi5mODJmYmI0YmJkYThlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL3JuYmQvcm5iZC1z
cnYtZGV2LmgKKysrIGIvZHJpdmVycy9ibG9jay9ybmJkL3JuYmQtc3J2LWRldi5oCkBAIC01Miw4
ICs1Miw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHJuYmRfZGV2X2dldF9tYXhfZGlzY2FyZF9zZWN0
cyhjb25zdCBzdHJ1Y3Qgcm5iZF9kZXYgKmRldikKIAlpZiAoIWJsa19xdWV1ZV9kaXNjYXJkKGJk
ZXZfZ2V0X3F1ZXVlKGRldi0+YmRldikpKQogCQlyZXR1cm4gMDsKIAotCXJldHVybiBibGtfcXVl
dWVfZ2V0X21heF9zZWN0b3JzKGJkZXZfZ2V0X3F1ZXVlKGRldi0+YmRldiksCi0JCQkJCSBSRVFf
T1BfRElTQ0FSRCk7CisJcmV0dXJuIGJkZXZfbWF4X2Rpc2NhcmRfc2VjdG9ycyhkZXYtPmJkZXYp
OwogfQogCiBzdGF0aWMgaW5saW5lIGludCBybmJkX2Rldl9nZXRfZGlzY2FyZF9ncmFudWxhcml0
eShjb25zdCBzdHJ1Y3Qgcm5iZF9kZXYgKmRldikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWQvZG0t
aW8uYyBiL2RyaXZlcnMvbWQvZG0taW8uYwppbmRleCA1NzYyMzY2MzMzYTI3Li5lNGI5NWVhZWVj
OGM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL21kL2RtLWlvLmMKKysrIGIvZHJpdmVycy9tZC9kbS1p
by5jCkBAIC0zMTEsNyArMzExLDcgQEAgc3RhdGljIHZvaWQgZG9fcmVnaW9uKGludCBvcCwgaW50
IG9wX2ZsYWdzLCB1bnNpZ25lZCByZWdpb24sCiAJICogUmVqZWN0IHVuc3VwcG9ydGVkIGRpc2Nh
cmQgYW5kIHdyaXRlIHNhbWUgcmVxdWVzdHMuCiAJICovCiAJaWYgKG9wID09IFJFUV9PUF9ESVND
QVJEKQotCQlzcGVjaWFsX2NtZF9tYXhfc2VjdG9ycyA9IHEtPmxpbWl0cy5tYXhfZGlzY2FyZF9z
ZWN0b3JzOworCQlzcGVjaWFsX2NtZF9tYXhfc2VjdG9ycyA9IGJkZXZfbWF4X2Rpc2NhcmRfc2Vj
dG9ycyh3aGVyZS0+YmRldik7CiAJZWxzZSBpZiAob3AgPT0gUkVRX09QX1dSSVRFX1pFUk9FUykK
IAkJc3BlY2lhbF9jbWRfbWF4X3NlY3RvcnMgPSBxLT5saW1pdHMubWF4X3dyaXRlX3plcm9lc19z
ZWN0b3JzOwogCWlmICgob3AgPT0gUkVRX09QX0RJU0NBUkQgfHwgb3AgPT0gUkVRX09QX1dSSVRF
X1pFUk9FUykgJiYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGFyZ2V0L3RhcmdldF9jb3JlX2Rldmlj
ZS5jIGIvZHJpdmVycy90YXJnZXQvdGFyZ2V0X2NvcmVfZGV2aWNlLmMKaW5kZXggMTZlNzc1YmNm
NGE3Yy4uYzNlMjViYWM5MGQ1OSAxMDA2NDQKLS0tIGEvZHJpdmVycy90YXJnZXQvdGFyZ2V0X2Nv
cmVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy90YXJnZXQvdGFyZ2V0X2NvcmVfZGV2aWNlLmMKQEAg
LTgyOSw5ICs4MjksOCBAQCBzdHJ1Y3Qgc2VfZGV2aWNlICp0YXJnZXRfYWxsb2NfZGV2aWNlKHN0
cnVjdCBzZV9oYmEgKmhiYSwgY29uc3QgY2hhciAqbmFtZSkKIH0KIAogLyoKLSAqIENoZWNrIGlm
IHRoZSB1bmRlcmx5aW5nIHN0cnVjdCBibG9ja19kZXZpY2UgcmVxdWVzdF9xdWV1ZSBzdXBwb3J0
cwotICogdGhlIFFVRVVFX0ZMQUdfRElTQ0FSRCBiaXQgZm9yIFVOTUFQL1dSSVRFX1NBTUUgaW4g
U0NTSSArIFRSSU0KLSAqIGluIEFUQSBhbmQgd2UgbmVlZCB0byBzZXQgVFBFPTEKKyAqIENoZWNr
IGlmIHRoZSB1bmRlcmx5aW5nIHN0cnVjdCBibG9ja19kZXZpY2Ugc3VwcG9ydHMgZGlzY2FyZCBh
bmQgaWYgeWVzCisgKiBjb25maWd1cmUgdGhlIFVOTUFQIHBhcmFtZXRlcnMuCiAgKi8KIGJvb2wg
dGFyZ2V0X2NvbmZpZ3VyZV91bm1hcF9mcm9tX3F1ZXVlKHN0cnVjdCBzZV9kZXZfYXR0cmliICph
dHRyaWIsCiAJCQkJICAgICAgIHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYpCkBAIC04NDMsNyAr
ODQyLDcgQEAgYm9vbCB0YXJnZXRfY29uZmlndXJlX3VubWFwX2Zyb21fcXVldWUoc3RydWN0IHNl
X2Rldl9hdHRyaWIgKmF0dHJpYiwKIAkJcmV0dXJuIGZhbHNlOwogCiAJYXR0cmliLT5tYXhfdW5t
YXBfbGJhX2NvdW50ID0KLQkJcS0+bGltaXRzLm1heF9kaXNjYXJkX3NlY3RvcnMgPj4gKGlsb2cy
KGJsb2NrX3NpemUpIC0gOSk7CisJCWJkZXZfbWF4X2Rpc2NhcmRfc2VjdG9ycyhiZGV2KSA+PiAo
aWxvZzIoYmxvY2tfc2l6ZSkgLSA5KTsKIAkvKgogCSAqIEN1cnJlbnRseSBoYXJkY29kZWQgdG8g
MSBpbiBMaW51eC9TQ1NJIGNvZGUuLgogCSAqLwpkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50
LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwppbmRleCAyMmRmZWI5OTE1MjkwLi43MWYwOWFkYmNiYTg2
IDEwMDY0NAotLS0gYS9mcy9mMmZzL3NlZ21lbnQuYworKysgYi9mcy9mMmZzL3NlZ21lbnQuYwpA
QCAtMTE5Niw5ICsxMTk2LDggQEAgc3RhdGljIGludCBfX3N1Ym1pdF9kaXNjYXJkX2NtZChzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmksCiAJCQkJCQl1bnNpZ25lZCBpbnQgKmlzc3VlZCkKIHsKIAlz
dHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2ID0gZGMtPmJkZXY7Ci0Jc3RydWN0IHJlcXVlc3RfcXVl
dWUgKnEgPSBiZGV2X2dldF9xdWV1ZShiZGV2KTsKIAl1bnNpZ25lZCBpbnQgbWF4X2Rpc2NhcmRf
YmxvY2tzID0KLQkJCVNFQ1RPUl9UT19CTE9DSyhxLT5saW1pdHMubWF4X2Rpc2NhcmRfc2VjdG9y
cyk7CisJCQlTRUNUT1JfVE9fQkxPQ0soYmRldl9tYXhfZGlzY2FyZF9zZWN0b3JzKGJkZXYpKTsK
IAlzdHJ1Y3QgZGlzY2FyZF9jbWRfY29udHJvbCAqZGNjID0gU01fSShzYmkpLT5kY2NfaW5mbzsK
IAlzdHJ1Y3QgbGlzdF9oZWFkICp3YWl0X2xpc3QgPSAoZHBvbGljeS0+dHlwZSA9PSBEUE9MSUNZ
X0ZTVFJJTSkgPwogCQkJCQkmKGRjYy0+ZnN0cmltX2xpc3QpIDogJihkY2MtPndhaXRfbGlzdCk7
CkBAIC0xMzc1LDkgKzEzNzQsOCBAQCBzdGF0aWMgdm9pZCBfX3VwZGF0ZV9kaXNjYXJkX3RyZWVf
cmFuZ2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAogCXN0cnVjdCBkaXNjYXJkX2NtZCAqZGM7
CiAJc3RydWN0IGRpc2NhcmRfaW5mbyBkaSA9IHswfTsKIAlzdHJ1Y3QgcmJfbm9kZSAqKmluc2Vy
dF9wID0gTlVMTCwgKmluc2VydF9wYXJlbnQgPSBOVUxMOwotCXN0cnVjdCByZXF1ZXN0X3F1ZXVl
ICpxID0gYmRldl9nZXRfcXVldWUoYmRldik7CiAJdW5zaWduZWQgaW50IG1heF9kaXNjYXJkX2Js
b2NrcyA9Ci0JCQlTRUNUT1JfVE9fQkxPQ0socS0+bGltaXRzLm1heF9kaXNjYXJkX3NlY3RvcnMp
OworCQkJU0VDVE9SX1RPX0JMT0NLKGJkZXZfbWF4X2Rpc2NhcmRfc2VjdG9ycyhiZGV2KSk7CiAJ
YmxvY2tfdCBlbmQgPSBsc3RhcnQgKyBsZW47CiAKIAlkYyA9IChzdHJ1Y3QgZGlzY2FyZF9jbWQg
KilmMmZzX2xvb2t1cF9yYl90cmVlX3JldCgmZGNjLT5yb290LApkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9ibGtkZXYuaCBiL2luY2x1ZGUvbGludXgvYmxrZGV2LmgKaW5kZXggMzRiMWNmZDA2
NzQyMS4uY2UxNjI0N2QzYWZhYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9ibGtkZXYuaAor
KysgYi9pbmNsdWRlL2xpbnV4L2Jsa2Rldi5oCkBAIC0xMjU0LDYgKzEyNTQsMTEgQEAgYmRldl96
b25lX3dyaXRlX2dyYW51bGFyaXR5KHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYpCiBpbnQgYmRl
dl9hbGlnbm1lbnRfb2Zmc2V0KHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYpOwogdW5zaWduZWQg
aW50IGJkZXZfZGlzY2FyZF9hbGlnbm1lbnQoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldik7CiAK
K3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGJkZXZfbWF4X2Rpc2NhcmRfc2VjdG9ycyhzdHJ1
Y3QgYmxvY2tfZGV2aWNlICpiZGV2KQoreworCXJldHVybiBiZGV2X2dldF9xdWV1ZShiZGV2KS0+
bGltaXRzLm1heF9kaXNjYXJkX3NlY3RvcnM7Cit9CisKIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQg
aW50IGJkZXZfd3JpdGVfemVyb2VzX3NlY3RvcnMoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldikK
IHsKIAlzdHJ1Y3QgcmVxdWVzdF9xdWV1ZSAqcSA9IGJkZXZfZ2V0X3F1ZXVlKGJkZXYpOwotLSAK
Mi4zMC4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
